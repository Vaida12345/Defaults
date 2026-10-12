//
//  EssentialTests.swift
//  Defaults
//
//  Created by Vaida on 2026-10-12.
//

import Testing
import Defaults
import Foundation

extension Tag {
    @Tag static var optional: Self
    @Tag static var rawRepresentable: Self
}

enum MyEnum: String, CaseIterable, Sendable {
    case first
    case second
    case third
}

private extension Defaults.Keys {
    
    var count: Defaults.Key<Int> {
        .init("EssentialTests_count", default: 0)
    }
    
    var optionalCount: Defaults.Key<Int?> {
        .init("EssentialTests_optionalCount")
    }
    
    var myEnum: Defaults.Key<MyEnum> {
        .init("EssentialTests_myEnum", default: .first)
    }
    
    var optionalMyEnum: Defaults.Key<MyEnum?> {
        .init("EssentialTests_optionalMyEnum")
    }
    
}

@Suite
struct EssentialTests {
    
    @Test func concreteType() {
        let key = "EssentialTests_count"
        UserDefaults.standard.removeObject(forKey: key)
        
        let value = Defaults.standard.count
        #expect(value == 0)
        
        Defaults.standard.count = 1
        #expect(Defaults.standard.count == 1)
        #expect(UserDefaults.standard.integer(forKey: key) == 1)
        
        UserDefaults.standard.set(2, forKey: key)
        #expect(Defaults.standard.count == 2)
        
        UserDefaults.standard.removeObject(forKey: key)
        #expect(Defaults.standard.count == 0) // reset to default
        
        UserDefaults.standard.set(2, forKey: key)
        #expect(Defaults.standard.count == 2)
        
        Defaults.standard.remove(\.count)
        #expect(UserDefaults.standard.object(forKey: key) == nil)
        #expect(Defaults.standard.count == 0) // reset to default
    }
    
    @Test(.tags(.optional)) func optionalType() {
        let key = "EssentialTests_optionalCount"
        UserDefaults.standard.removeObject(forKey: key)
        
        let value = Defaults.standard.optionalCount
        #expect(value == nil)
        
        Defaults.standard.optionalCount = 1
        #expect(Defaults.standard.optionalCount == 1)
        #expect(UserDefaults.standard.integer(forKey: key) == 1)
        
        UserDefaults.standard.set(2, forKey: key)
        #expect(Defaults.standard.optionalCount == 2)
        
        UserDefaults.standard.removeObject(forKey: key)
        #expect(Defaults.standard.optionalCount == nil)
        
        UserDefaults.standard.set(2, forKey: key)
        #expect(Defaults.standard.optionalCount == 2)
        
        Defaults.standard.remove(\.optionalCount)
        #expect(UserDefaults.standard.object(forKey: key) == nil)
        #expect(Defaults.standard.optionalCount == nil)
        
        UserDefaults.standard.set(2, forKey: key)
        #expect(Defaults.standard.optionalCount == 2)
        
        Defaults.standard.optionalCount = nil
        #expect(UserDefaults.standard.object(forKey: key) == nil)
        #expect(Defaults.standard.optionalCount == nil)
    }
    
    @Test(.tags(.rawRepresentable)) func rawRepresentableType() {
        let key = "EssentialTests_myEnum"
        UserDefaults.standard.removeObject(forKey: key)
        
        let value = Defaults.standard.myEnum
        #expect(value == .first)
        
        Defaults.standard.myEnum = .second
        #expect(Defaults.standard.myEnum == .second)
        #expect(UserDefaults.standard.string(forKey: key) == MyEnum.second.rawValue) // raw value
        
        UserDefaults.standard.set(MyEnum.third.rawValue, forKey: key)
        #expect(Defaults.standard.myEnum == .third)
        
        UserDefaults.standard.removeObject(forKey: key)
        #expect(Defaults.standard.myEnum == .first) // reset to default
        
        UserDefaults.standard.set(MyEnum.third.rawValue, forKey: key)
        #expect(Defaults.standard.myEnum == .third)
        
        Defaults.standard.remove(\.myEnum)
        #expect(UserDefaults.standard.object(forKey: key) == nil)
        #expect(Defaults.standard.myEnum == .first) // reset to default
    }
    
    @Test(.tags(.optional, .rawRepresentable)) func optionalRawRepresentableType() {
        let key = "EssentialTests_optionalMyEnum"
        UserDefaults.standard.removeObject(forKey: key)
        
        let value = Defaults.standard.optionalMyEnum
        #expect(value == nil)
        
        Defaults.standard.optionalMyEnum = .second
        #expect(Defaults.standard.optionalMyEnum == .second)
        #expect(UserDefaults.standard.string(forKey: key) == MyEnum.second.rawValue) // raw value
        
        UserDefaults.standard.set(MyEnum.third.rawValue, forKey: key)
        #expect(Defaults.standard.optionalMyEnum == .third)
        
        UserDefaults.standard.removeObject(forKey: key)
        #expect(Defaults.standard.optionalMyEnum == nil) // reset to default
        
        UserDefaults.standard.set(MyEnum.third.rawValue, forKey: key)
        #expect(Defaults.standard.optionalMyEnum == .third)
        
        Defaults.standard.remove(\.optionalMyEnum)
        #expect(UserDefaults.standard.object(forKey: key) == nil)
        #expect(Defaults.standard.optionalMyEnum == nil) // reset to default
    }
}
