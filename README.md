# Defaults

A type-safe wrapper to `UserDefaults`.

## Type-safe user defaults

This package utilizes a singleton named `standard` to represent the default suite of user preferences. By using this singleton, you can access your stored user preferences as instance properties.

```swift
let enabled = Defaults.standard.memorySaver
```

To declare a user default key, you create an extension on`Defaults.Key`.

```swift
extension Defaults.Key where Value == Void {

    /// Indicates whether memory saver is enabled.
    var memorySaver: Defaults.Key<Bool> {
        .init("memory_saver", default: false)
    }
}
```

Please note that the signature for the sources of extension should be `Defaults.Key where Value == Void`. The keys are defined as instance properties to support Xcode's autocomplete feature for `@dynamicMemberLookup`.


### Integration with SwiftUI

You can retrieve and observe defaults using `AppStorage`, similar to how you can access `UserDefaults` using its identifier.

```swift
@AppStorage(\.memorySaver) private var enabled
```

## Getting Started

`Defaults` uses [Swift Package Manager](https://www.swift.org/documentation/package-manager/) as its build tool. If you want to import in your own project, it's as simple as adding a `dependencies` clause to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/Vaida12345/Defaults.git", from: "1.0.0")
]
```
and then adding the appropriate module to your target dependencies.

### Using Xcode Package support

You can add this framework as a dependency to your Xcode project by clicking File -> Swift Packages -> Add Package Dependency. The package is located at:
```
https://github.com/Vaida12345/Defaults.git
```

## Documentation

This package uses [DocC](https://www.swift.org/documentation/docc/) for documentation.
