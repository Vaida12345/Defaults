//
//  Defaults + AppStorage.swift
//  Defaults
//
//  Created by Vaida on 2025-07-05.
//

#if canImport(SwiftUI)
import SwiftUI


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {
    
    /// Creates a property that can read and write to a boolean user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Bool {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to an integer user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Int {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a double user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Double {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a string user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == String {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a url user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == URL {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a date user default.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Date {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a user default as data.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Data {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value : RawRepresentable, Value.RawValue == Int {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value : RawRepresentable, Value.RawValue == String {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier)
    }
    
}


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {

    /// Returns an identifier after registering the optional key's default value in the standard defaults store.
    private static func makeIdentifier<T>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) -> String where Value == Optional<T> {
        let key = Defaults.Keys()[keyPath: keyPath]

        if UserDefaults.standard.object(forKey: key.identifier) == nil {
            UserDefaults.standard.set(key.defaultValue, forKey: key.identifier)
        }

        return key.identifier
    }

    /// Creates a property that can read and write to a boolean user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Bool? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to an integer user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Int? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a double user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Double? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a string user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == String? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a url user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == URL? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a date user default.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Date? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a user default as data.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Data? {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AppStorage {
    
    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == R?, R : RawRepresentable, R.RawValue == String {
        self.init(AppStorage.makeIdentifier(keyPath), store: .standard)
    }
    
}
#endif
