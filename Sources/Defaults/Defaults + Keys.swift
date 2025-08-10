//
//  Defaults + Keys.swift
//  Defaults
//
//  Created by Vaida on 2025-08-10.
//


extension Defaults {
    
    /// A collection of `Defaults` keys.
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
    public struct Keys {
        
        
        internal init() {
            
        }
        
    }
    
}
