//
//  Defaults.swift
//  Defaults
//
//  Created by Vaida on 2025-07-05.
//

import Foundation


/// A type-safe wrapper to `UserDefaults`.
///
/// To declare a user default key
/// ```swift
/// extension Defaults.Keys {
///     var <#identifier#>: Defaults.Key<<#Type#>> {
///         .init(<#identifier#>, default: <#default#>)
///     }
/// }
/// ```
///
/// Then, you can access the value stored in `UserDefaults` via
/// ```swift
/// Defaults.standard.<#identifier#>
/// ```
///
/// ## Integration with SwiftUI
/// You can retrieve and observe defaults using `AppStorage`
/// ```swift
/// @AppStorage(\.<#identifier#>) private var <#identifier#>
/// ```
@dynamicMemberLookup
public struct Defaults {
    
    internal let userDefaults: UserDefaults
    
    /// A global instance of `Defaults` configured to search the current application's search list.
    public static var standard: Defaults {
        Defaults(userDefaults: .standard)
    }
    
    /// Creates a user defaults object initialized with the defaults for the specified database name.
    public static func suite(named name: String) -> Defaults? {
        guard let userDefaults = UserDefaults(suiteName: name) else { return nil }
        return Defaults(userDefaults: userDefaults)
    }
    
    
    /// Removes the values associated with the given `keyPath`.
    ///
    /// This will remove the object associated with the key, and effectively reset the value to its `defaultValue`.
    ///
    /// > Tip:
    /// > For keys with optional types, setting the key to `nil` will remove the value, similar to Swift dictionaries.
    /// > ```swift
    /// > Defaults.standard.password = nil
    /// > ```
    public func remove<T>(_ keyPath: KeyPath<Defaults.Keys, Defaults.Key<T>>) {
        let key = Keys()[keyPath: keyPath]
        userDefaults.removeObject(forKey: key.identifier)
    }
    
    
    internal func load<T, I>(keyPath: KeyPath<Defaults.Keys, Defaults.Key<T>>, intermediate: I.Type, returnClosure: (_ intermediate: I) -> T) -> T {
        let key = Keys()[keyPath: keyPath]
        
        let object = userDefaults.object(forKey: key.identifier)
        if object == nil { return key.defaultValue }
        
        guard let value = object as? I else {
            preconditionFailure("Type associated with \"\(key.identifier)\" mismatch; expected: \(I.self), actual: \(String(describing: type(of: object!))).")
        }
        
        return returnClosure(value)
    }
    
    
    /// Use dynamic member to modify or retrieve a defaults.
    ///
    /// This is an implementation detail, and you should not interact with this subscript directly. You should access the values as instance properties.
    ///
    /// ```swift
    /// let enabled = Defaults.standard.memorySaver
    /// ```
    @_disfavoredOverload
    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T>>) -> T {
        get {
            self.load(keyPath: keyPath, intermediate: T.self, returnClosure: \.self)
        }
        nonmutating set {
            let key = Keys()[keyPath: keyPath]
            userDefaults.set(newValue, forKey: key.identifier)
        }
    }
    
    /// Use dynamic member to modify or retrieve a defaults.
    ///
    /// This is an implementation detail, and you should not interact with this subscript directly. You should access the values as instance properties.
    ///
    /// ```swift
    /// let enabled = Defaults.standard.memorySaver
    /// ```
    ///
    /// An object is removed when you set the new value as `nil`.
    public subscript<T>(dynamicMember keyPath: KeyPath<Defaults.Keys, Defaults.Key<T?>>) -> T? {
        get {
            self.load(keyPath: keyPath, intermediate: T.self, returnClosure: \.self)
        }
        nonmutating set {
            let key = Keys()[keyPath: keyPath]
            
            if newValue == nil {
                userDefaults.removeObject(forKey: key.identifier)
            } else {
                userDefaults.set(newValue, forKey: key.identifier)
            }
        }
    }
}
