//
//  Defaults + Overload.swift
//  Defaults
//
//  Created by Vaida on 2025-08-31.
//


extension Defaults {
    
    @_disfavoredOverload
    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T>>) -> T where T: RawRepresentable {
        get {
            let key = Keys()[keyPath: keyPath]
            let object = userDefaults.object(forKey: key.identifier)
            if object == nil { return key.defaultValue }
            guard let rawValue = object as? T.RawValue else {
                preconditionFailure("Type associated with \"\(key.identifier)\" mismatch; expected: \(T.RawValue.self), actual: \(String(describing: type(of: object!))).")
            }
            guard let value = T(rawValue: rawValue) else {
                preconditionFailure("Cannot initialize \(T.self) from raw value \"\(rawValue)\" stored for key \"\(key.identifier)\".")
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
                preconditionFailure("Type associated with \"\(key.identifier)\" mismatch; expected: \(T.RawValue.self), actual: \(String(describing: type(of: object!))).")
            }
            guard let value = T(rawValue: rawValue) else {
                preconditionFailure("Cannot initialize \(T.self) from raw value \"\(rawValue)\" stored for key \"\(key.identifier)\".")
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
