## Optional
A type that represents either a wrapped value or the absence of a value.(cho phép biến có thể chứa hoặc không chứa giá trị)

```swift
let name: String? = "Antoine van der Lee"
print(name?.count ?? 0)
```

### 1. Forced Unwrapping optionals in Swift

*Force Unwrapping* either returns the value if it exists or triggers a runtime error when the value is `nil`.

### How to unwrap an optional?

There are multiple ways to unwrap a value in Swift. You can use a guard statement:

```swift
let name: String? = "Antoine van der Lee"
guard let unwrappedName = name else {
    return
}
print(unwrappedName.count)
```

Or you can use an if let statement:

```swift
let name: String? = "Antoine van der Lee"
if let unwrappedName = name {
    print(unwrappedName.count)
}
```

### 2. Force unwrapping using the exclamation mark (!)

An optional can be forced unwrapped using the exclamation mark (!) directly after the value:

Swift lets you override its safety by using the exclamation mark character: `!`. If you know that an optional definitely has a value, you can force unwrap it by placing this exclamation mark after it.

```swift
var name: String? = "Antoine van der Lee"
print(name!.count)
Fatal error: Unexpectedly found nil while unwrapping an Optional value
```

### 3. Unwrapping can be chained

Optional chaining can be done like this:

```swift
struct BlogPost {
    let title: String?
}

let post: BlogPost? = BlogPost(title: "Learning everything about optionals")
print(post?.title?.count ?? 0)
```

And the same counts for force unwrapping:

```swift
let post: BlogPost? = BlogPost(title: "Learning everything about optionals")
print(post!.title!.count)
```

### 4. An optional is an enum of two cases

It’s good to know that an optional is basically an enum of two cases:

```swift
enum Optional<Wrapped> {
    /// The absence of a value.
    case none

    /// The presence of a value, stored as `Wrapped`.
    case some(Wrapped)
}
```

However, instead of using the `.none` case you would use `nil` to indicate the absence of a value.

Or you can use a switch-case just like you would with a normal enum:

```swift
func printName(_ name: String?) {
    switch name {
    case .some(let unwrappedValue):
        print("Name is \(unwrappedValue)")
    case .none:
        print("Name is nil")
    }
}

printName(nil) // Prints: "Name is nil"
printName("Antoine van der Lee") // Prints: "Name is Antoine van der Lee"
```

### 5 Special nil & null

	#### 5.1 Nil

• Usage context: Commonly found in languages such as Ruby, Lua, Objective-C, Swift, and Elixir.

• Definition:
• nil represents “no value” or “empty”.
• Often used as a continuous integer representing the state of “nothing”.

• Properties: • nil is an object (especially in Ruby). • It can have methods that are called directly.

#### 5.2 Null

• Usage context: Commonly found in languages such as Java, JavaScript, C#, PHP, and SQL.

• Definition:
• null represents a state of “no reference”. It is often used to indicate that a variable does not refer to any object.

• Properties:
• null is not an object but a special value.
• In some languages (e.g. C#), accessing properties or methods on a null value will result in an error (NullReferenceException).

