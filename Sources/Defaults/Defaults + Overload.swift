//
//  Defaults + Overload.swift
//  Defaults
//
//  Created by Vaida on 2025-08-31.
//

import OSLog


extension Defaults {
    
    @_disfavoredOverload
    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T>>) -> T where T: RawRepresentable {
        get {
            let key = Keys()[keyPath: keyPath]
            let object = userDefaults.object(forKey: key.identifier)
            if object == nil { return key.defaultValue }
            guard let rawValue = object as? T.RawValue else {
                let logger = Logger(subsystem: "Defaults", category: "TypeChecker")
                logger.warning("The value stored for key \"\(key.identifier)\" has type \(String(describing: type(of: object!))), but \(T.RawValue.self) was expected. This can result from reusing an identifier. Returning the default value.")
                return key.defaultValue
            }
            guard let value = T(rawValue: rawValue) else {
                let logger = Logger(subsystem: "Defaults", category: "TypeChecker")
                logger.warning("The raw value \"\(String(describing: rawValue))\" stored for key \"\(key.identifier)\" cannot initialize \(T.self). Returning the default value.")
                return key.defaultValue
            }
            return value
        }
        nonmutating set {
            let key = Keys()[keyPath: keyPath]
            userDefaults.set(newValue.rawValue, forKey: key.identifier)
        }
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T?>>) -> T? where T: RawRepresentable {
        get {
            let key = Keys()[keyPath: keyPath]
            let object = userDefaults.object(forKey: key.identifier)
            if object == nil { return key.defaultValue }
            guard let rawValue = object as? T.RawValue else {
                let logger = Logger(subsystem: "Defaults", category: "TypeChecker")
                logger.warning("The value stored for key \"\(key.identifier)\" has type \(String(describing: type(of: object!))), but \(T.RawValue.self) was expected. This can result from reusing an identifier. Returning the default value.")
                return key.defaultValue
            }
            guard let value = T(rawValue: rawValue) else {
                let logger = Logger(subsystem: "Defaults", category: "TypeChecker")
                logger.warning("The raw value \"\(String(describing: rawValue))\" stored for key \"\(key.identifier)\" cannot initialize \(T.self). Returning the default value.")
                return key.defaultValue
            }
            return value
        }
        nonmutating set {
            let key = Keys()[keyPath: keyPath]
            if newValue == nil {
                userDefaults.removeObject(forKey: key.identifier)
            } else {
                userDefaults.set(newValue?.rawValue, forKey: key.identifier)
            }
        }
    }
    
}
