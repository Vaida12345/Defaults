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

    /// Creates a property that can read and write to a boolean user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Bool {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to an integer user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Int {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a double user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Double {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a string user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == String {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a URL user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == URL {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a date user default in the specified store.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Date {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a user default as data in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Data {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to an integer user default in the specified store, transforming that to `RawRepresentable` data type.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value : RawRepresentable, Value.RawValue == Int {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }

    /// Creates a property that can read and write to a string user default in the specified store, transforming that to `RawRepresentable` data type.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value : RawRepresentable, Value.RawValue == String {
        let key = Defaults.Keys()[keyPath: keyPath]
        self.init(wrappedValue: key.defaultValue, key.identifier, store: store)
    }
    
}


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {

    /// Creates a property that can read and write to a boolean user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Bool? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to an integer user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Int? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a double user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Double? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a string user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == String? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a url user default.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == URL? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a date user default.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Date? {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a user default as data.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == Data? {
        self.init(keyPath, store: .standard)
    }

    /// Creates a property that can read and write to a boolean user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Bool? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to an integer user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Int? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a double user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Double? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a string user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == String? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a URL user default in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == URL? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a date user default in the specified store.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Date? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a user default as data in the specified store.
    public init(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == Data? {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }
}


@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AppStorage {
    
    /// Creates a property that can read and write to an integer user default, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        self.init(keyPath, store: .standard)
    }
    
    /// Creates a property that can read and write to a string user default, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>) where Value == R?, R : RawRepresentable, R.RawValue == String {
        self.init(keyPath, store: .standard)
    }

    /// Creates a property that can read and write to an integer user default in the specified store, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }

    /// Creates a property that can read and write to a string user default in the specified store, transforming that to `RawRepresentable` data type.
    public init<R>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<Value>>, store: UserDefaults) where Value == R?, R : RawRepresentable, R.RawValue == String {
        let key = Defaults.Keys()[keyPath: keyPath]
        if store.object(forKey: key.identifier) == nil {
            Defaults(userDefaults: store)[dynamicMember: keyPath] = key.defaultValue
        }
        self.init(key.identifier, store: store)
    }
    
}
#endif
