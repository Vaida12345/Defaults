//
//  AppStorageTests.swift
//  Defaults
//
//  Created by Vaida on 2026-10-12.
//

import Testing
import SwiftUI
import Defaults
import Synchronization
#if os(macOS)
import AppKit
#endif

private extension Defaults.Keys {
    
    var optionalMyEnum: Defaults.Key<MyEnum?> {
        .init("AppStorageTests_optionalMyEnum")
    }
    
    var myEnum: Defaults.Key<MyEnum> {
        .init("AppStorageTests_myEnum", default: .third)
    }
    
}

@Suite
struct AppStorageTests {
    
    @Test func assignValues() {
        Defaults.standard.remove(\.myEnum)
        @AppStorage(\.myEnum) var myEnum
        #expect(myEnum == .third)
        
        Defaults.standard.myEnum = .first
        #expect(myEnum == .first)
        
        myEnum = .second
        #expect(myEnum == .second)
        #expect(Defaults.standard.myEnum == .second)
    }
    
#if os(macOS)
    @available(macOS 15.0, *)
    @MainActor
    @Test
    func customSuiteResolution() async throws {
        let key = "AppStorageTests_optionalMyEnum"
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults(suiteName: "custom.domain")!.removeObject(forKey: key)
        
        Defaults.custom.optionalMyEnum = .second
        
        struct TestView: View {
            @AppStorage(\.optionalMyEnum) private var optionalMyEnum
            let onResolve: (MyEnum?) -> Void
            
            var body: some View {
                Color.clear
                    .onAppear {
                        onResolve(optionalMyEnum)
                    }
            }
        }
        
        let resolvedMyEnum = Mutex<MyEnum?>(nil)
        
        let view = TestView { resolved in
            resolvedMyEnum.withLock { $0 = resolved }
        }
        .defaultAppStorage(UserDefaults(suiteName: "custom.domain")!)
        
        let hostingView = NSHostingView(rootView: view)
        
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 100, height: 100),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        window.contentView = hostingView
        window.orderFront(nil)
        
        try await Task.sleep(for: .seconds(0.5))
        
        let result = resolvedMyEnum.withLock({ $0 })
        #expect(result == .second)
    }
#endif
    
}
