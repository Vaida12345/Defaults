# ``Defaults``

A type-safe wrapper to `UserDefaults`.

## Overview

This package utilizes a singleton named `standard` to represent the default suite of user preferences. By using this singleton, you can access your stored user preferences as instance properties.

```swift
let enabled = Defaults.standard.memorySaver
```

To declare a user default key, you create an extension on `Defaults.Keys`.

```swift
extension Defaults.Keys {

    /// Indicates whether memory saver is enabled.
    var memorySaver: Defaults.Key<Bool> {
        .init("memory_saver", default: false)
    }
}
```

> Note: 
> The keys are defined as instance properties to support Xcode's autocomplete feature for `@dynamicMemberLookup`.


### Integration with SwiftUI

You can retrieve and observe defaults using `AppStorage`, similar to how you can access `UserDefaults` using its identifier.

```swift
@AppStorage(\.memorySaver) private var enabled
```

- Warning: Optional value must have a default value of `nil` to be used in AppStorage.

## Topics

### Structures

- ``Defaults/Defaults``
- ``Defaults/Keys``
- ``Defaults/Key``
