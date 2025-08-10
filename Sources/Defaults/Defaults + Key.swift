//
//  Defaults + Key.swift
//  Defaults
//
//  Created by Vaida on 2025-07-05.
//


extension Defaults {
    
    /// A key for defaults lookup
    ///
    /// To declare a user default key, you create an extension on `Defaults.Keys`.
    ///
    /// ```swift
    /// extension Defaults.Keys {
    ///
    ///     /// Indicates whether memory saver is enabled.
    ///     var memorySaver: Defaults.Key<Bool> {
    ///         .init("memory_saver", default: false)
    ///     }
    /// }
    /// ```
    ///
    /// > Note:
    /// > The keys are defined as instance properties to support Xcode's autocomplete feature for `@dynamicMemberLookup`.
    public struct Key<Value> {
        
        @usableFromInline
        let identifier: String
        
        @usableFromInline
        let defaultValue: Value
        
        
        /// Initialize a new defaults key.
        ///
        /// - Parameters:
        ///   - identifier: The identifier for the given key.
        ///   - defaultValue: The default value for the given key. The default value will be used when there does not exist a value associated with `identifier`.
        ///
        /// - Warning: You need to ensure the `identifier` is used uniquely. `preconditionError` will be thrown if the type associated with a key is unexpected.
        @inlinable
        public init(_ identifier: String, default defaultValue: Value) {
            self.identifier = identifier
            self.defaultValue = defaultValue
        }
        
        /// Initialize a new defaults key.
        ///
        /// - Parameters:
        ///   - identifier: The identifier for the given key.
        ///
        /// - Warning: You need to ensure the `identifier` is used uniquely. `preconditionError` will be thrown if the type associated with a key is unexpected.
        @inlinable
        public init(_ identifier: String) where Value: ExpressibleByNilLiteral {
            self.identifier = identifier
            self.defaultValue = nil
        }
        
    }
    
}
