//
//  Defaults.swift
//  Defaults
//
//  Created by Vaida on 2025-07-05.
//

import Testing
import SwiftUI
import Defaults


enum MyEnum: String, CaseIterable {
    case first
    case second
}

enum IntEnum: Int, CaseIterable {
    case one = 1
    case two = 2
}


private extension Defaults.Keys {
    
    var password: Defaults.Key<String?> {
        .init("password")
    }
    
    var enabled: Defaults.Key<Bool> {
        .init("enabled", default: false)
    }
    
    var rawRepresentable: Defaults.Key<MyEnum?> {
        .init("rawRepresentable")
    }
    
    var rawRep: Defaults.Key<MyEnum> {
        .init("rawP", default: .first)
    }

    var intRawOptional: Defaults.Key<IntEnum?> {
        .init("intRawOptional")
    }

    var intRaw: Defaults.Key<IntEnum> {
        .init("intRaw", default: .one)
    }

    var suiteKey: Defaults.Key<String> {
        .init("suiteKey", default: "default")
    }

}


@Suite(.serialized) struct DefaultsTests {
    
    @Test func defaultsTest() {
        UserDefaults.standard.removeObject(forKey: "enabled")
        
        let value = Defaults.standard.enabled
        #expect(value == false)
        
        Defaults.standard.enabled = true
        #expect(Defaults.standard.enabled == true)
    }
    
    @Test func optionalDefaultsTest() {
        UserDefaults.standard.removeObject(forKey: "password")
        
        let value = Defaults.standard.password
        #expect(value == nil)
        
        Defaults.standard.password = "123456"
        #expect(Defaults.standard.password == "123456")
    }
    
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @Test(arguments: [nil, "1234"]) func swiftuiTest(defaultValue: String?) {
        Defaults.standard.password = defaultValue
        
        @AppStorage("password") var oldPassword: String?
        var old = ""
        dump(_oldPassword, to: &old)
        
        @AppStorage(\.password) var newPassword
        var new = ""
        dump(_newPassword, to: &new)
        
        #expect(old == new)
    }
    
    
    @Test func remove() throws {
        Defaults.standard.enabled = true
        try #require(Defaults.standard.enabled == true)
        Defaults.standard.remove(\.enabled)
        #expect(Defaults.standard.enabled == false)
        
        Defaults.standard.password = "123456"
        try #require(Defaults.standard.password == "123456")
        Defaults.standard.remove(\.password)
        #expect(Defaults.standard.password == nil)
        
        Defaults.standard.password = "123456"
        try #require(Defaults.standard.password == "123456")
        Defaults.standard.password = nil
        #expect(Defaults.standard.password == nil)
    }
    
    @Test func raw() throws {
        Defaults.standard.rawRepresentable = .first
        #expect(Defaults.standard.rawRepresentable == .first)
        Defaults.standard.rawRepresentable = .second
        #expect(Defaults.standard.rawRepresentable == .second)
        Defaults.standard.rawRepresentable = nil
        #expect(Defaults.standard.rawRepresentable == nil)
        
        Defaults.standard.rawRep = .first
        #expect(Defaults.standard.rawRep == .first)
        Defaults.standard.rawRep = .second
        #expect(Defaults.standard.rawRep == .second)
        Defaults.standard.remove(\.rawRep)
        #expect(Defaults.standard.rawRep == .first)
    }

    @Test func intRawRepresentable() throws {
        Defaults.standard.intRawOptional = .one
        #expect(Defaults.standard.intRawOptional == .one)
        Defaults.standard.intRawOptional = .two
        #expect(Defaults.standard.intRawOptional == .two)
        Defaults.standard.intRawOptional = nil
        #expect(Defaults.standard.intRawOptional == nil)

        Defaults.standard.intRaw = .one
        try #require(Defaults.standard.intRaw == .one)
        Defaults.standard.intRaw = .two
        #expect(Defaults.standard.intRaw == .two)
        Defaults.standard.remove(\.intRaw)
        #expect(Defaults.standard.intRaw == .one)
    }

    @Test func suite() throws {
        guard let suite = Defaults.suite(named: "testSuite") else {
            Issue.record("Failed to create suite")
            return
        }
        suite.suiteKey = "hello"
        #expect(suite.suiteKey == "hello")
        suite.remove(\.suiteKey)
        #expect(suite.suiteKey == "default")
    }

    @Test func storageRoundTrip() throws {
        UserDefaults.standard.removeObject(forKey: "enabled")
        try #require(UserDefaults.standard.object(forKey: "enabled") == nil)

        Defaults.standard.enabled = true
        #expect(UserDefaults.standard.bool(forKey: "enabled") == true)

        Defaults.standard.enabled = false
        #expect(UserDefaults.standard.bool(forKey: "enabled") == false)
    }
}
