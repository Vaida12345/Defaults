//
//  Defaults + RawRepresentable.swift
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
                os_log(
                    "The value stored for key \"%{public}@\" has type %{public}@, but %{public}@ was expected. This can result from reusing an identifier. Returning the default value.",
                    log: Defaults.typeCheckerLog,
                    type: .error,
                    key.identifier,
                    String(describing: type(of: object!)),
                    String(describing: T.RawValue.self)
                )
                return key.defaultValue
            }
            guard let value = T(rawValue: rawValue) else {
                os_log(
                    "The raw value \"%{private}@\" stored for key \"%{public}@\" cannot initialize %{public}@. Returning the default value.",
                    log: Defaults.typeCheckerLog,
                    type: .error,
                    String(describing: rawValue),
                    key.identifier,
                    String(describing: T.self)
                )
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
                os_log(
                    "The value stored for key \"%{public}@\" has type %{public}@, but %{public}@ was expected. This can result from reusing an identifier. Returning the default value.",
                    log: Defaults.typeCheckerLog,
                    type: .error,
                    key.identifier,
                    String(describing: type(of: object!)),
                    String(describing: T.RawValue.self)
                )
                return key.defaultValue
            }
            guard let value = T(rawValue: rawValue) else {
                os_log(
                    "The raw value \"%{private}@\" stored for key \"%{public}@\" cannot initialize %{public}@. Returning the default value.",
                    log: Defaults.typeCheckerLog,
                    type: .error,
                    String(describing: rawValue),
                    key.identifier,
                    String(describing: T.self)
                )
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
