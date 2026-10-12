//
//  SuiteTests.swift
//  Defaults
//
//  Created by Vaida on 2026-10-12.
//

import Testing
import Defaults
import Foundation

private extension Defaults.Keys {
    
    var optionalMyEnum: Defaults.Key<MyEnum?> {
        .init("SuiteTests_optionalMyEnum")
    }
    
}


extension Defaults {
    
    static var custom: Defaults {
        Defaults.suite(named: "custom.domain")!
    }
    
}


@Suite
struct SuiteTests {
    
    @Test func ensureSeparate() {
        let key = "SuiteTests_optionalMyEnum"
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults(suiteName: "custom.domain")!.removeObject(forKey: key)
        
        Defaults.custom.optionalMyEnum = .second
        #expect(Defaults.custom.optionalMyEnum == .second)
        #expect(UserDefaults(suiteName: "custom.domain")!.string(forKey: key) == MyEnum.second.rawValue)
        
        #expect(Defaults.standard.optionalMyEnum == nil)
        #expect(UserDefaults.standard.string(forKey: key) == nil)
        
        
        Defaults.standard.optionalMyEnum = .third
        #expect(Defaults.standard.optionalMyEnum == .third)
        #expect(UserDefaults.standard.string(forKey: key) == MyEnum.third.rawValue)
        
        #expect(Defaults.custom.optionalMyEnum == .second)
        #expect(UserDefaults(suiteName: "custom.domain")!.string(forKey: key) == MyEnum.second.rawValue)
    }
    
}
