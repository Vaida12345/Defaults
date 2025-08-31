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
            return self.load(keyPath: keyPath, intermediate: T.RawValue.self, returnClosure: { T(rawValue: $0)! })
        }
        nonmutating set {
            let key = Keys()[keyPath: keyPath]
            userDefaults.set(newValue.rawValue, forKey: key.identifier)
        }
    }
    
    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T?>>) -> T? where T: RawRepresentable {
        get {
            return self.load(keyPath: keyPath, intermediate: T.RawValue.self, returnClosure: { T(rawValue: $0)! })
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
