## Singleton

Singletons are objects that should only ever be created once, then shared everywhere they need to be used. They are common on Apple’s platforms: FileManager, UserDefaults, UIApplication, and UIAccelerometer are all mostly used through their singleton implementations.
The basic implementation of a Swift singleton looks like this:
```swift
class Settings {
    static let shared = Settings()
    var username: String?

    private init() { }
}
```
Adding a private initializer is important, because it stops other parts of our code from trying to create a Settings class instance. However, the class creates its own instance of itself as a static variable, which means the only instance of the Settings class is the one it created: Settings.shared.
