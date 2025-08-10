//
//  Defaults.swift
//  Defaults
//
//  Created by Vaida on 2025-07-05.
//

import Testing
import SwiftUI
import Defaults


private extension Defaults.Keys {
    
    var password: Defaults.Key<String?> {
        .init("password")
    }
    
    var enabled: Defaults.Key<Bool> {
        .init("enabled", default: false)
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
}
