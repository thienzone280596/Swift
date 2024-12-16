## Struct and Class

#### Swift Struct vs. Class: The Basics
In Swift, structs are value types, and classes are reference types. This general trait is the primary difference between a struct and a class in Swift, with structs designed for value semantics. A class instance is passed by reference, meaning multiple references can point to the same class instance. This mechanism is backed by Swift’s automatic reference counting system, making sure memory is managed effectively. The reference count increases when a new reference to a class instance is created and decreases when a reference is removed, ensuring proper memory allocation and deallocation.

```Swift
class SomeClass {
    var name: String = ""
}

let instanceA = SomeClass()
instanceA.name = "Swift"

let instanceB = instanceA // The same instance is pointed by instanceB
instanceB.name = "Apple"

print(instanceA.name) // Prints "Apple"
```
Here, changes to instanceB also reflect on instanceA because they both refer to the same object. In contrast, struct instances are passed by value. Each struct instance holds a copy of the data, and any modification is not reflected on any other instance.

The concept of value types and reference types forms the crux of the Swift Struct vs. Class’ distinction. Hence, it’s an essential point to properly understand.
#### Reference Types and Value Types in Swift
##### The concept of Reference Types and Reference Counting
Reference types in Swift come into play when dealing with Swift Class instances. A reference to a class instance is passed around the application. It ensures that you are dealing with the same object in multiple places in your app, where these are not separate instances but the same instance. Different constants can refer to the same value, meaning they are just different names for the same single instance, and modifying one would affect the other. This behavior is known as reference semantics.

Additionally, inheritance enables one class to inherit the characteristics of another, providing more flexibility and reusability in your code.

The other side of this concept involves automatic reference counting, which Swift uses to track and manage your app’s memory usage.
##### The concept of Value Types and Value Semantics
In Swift, all the basic data types like Int, Float, and Bool are all value types. They store values and define methods to provide functionality, ensuring you are dealing with a completely separate instance every time.

Here’s a struct example:
```swift
struct SomeStruct {
    var width: Int = 0
}

var instanceA = SomeStruct()
instanceA.width = 5

var instanceB = instanceA
instanceB.width = 10

print(instanceA.width) // Prints "5"
```
When a resolution instance is initialized, it behaves as a separate copy, ensuring that changes to one instance do not affect another. For instanceB, Swift created a new completely separate instance (even though it might seem like instanceB is just a reference to instanceA).
#### Swift Struct: Deeper Dive
##### Swift Struct Inheritance
Unlike classes, structs don't support inheritance. Structs are good for representing simple data models where there isn't a hierarchy of types. Therefore, they are the preferred choice for many Swift data models over classes. Structs come with a built-in memberwise initializer. However, you could still define a custom initializer, like int init or string init if needed.
#### Swift Struct init
When creating a struct, Swift lets you take advantage of a memberwise initializer – a default initializer with access to all the properties of a struct, allowing you to set initial or default values.
```Swift
struct DigitalCinemaProjection {
    var name: String
    var HD: Bool
}

var cinema = DigitalCinemaProjection(name: "John's Theatre", HD: true)
```
##### Swift Struct Mutating
In Swift, struct instances are value types. When a struct's property is modified within its method, Swift requests that the method be marked with the mutating keyword to indicate that it changes the value of the struct.
##### Swift Struct Constructor
Swift struct constructor – officially known as the memberwise initializer – creates new instances of a struct. The memberwise initializer is a shorthand way to initialize the member properties of new struct instances - a feature that isn't available in many other programming languages.
##### Swift Struct Extension
Structs in Swift are extendable. Extensions are a powerful feature of the Swift programming language that allows you to add functionality to existing data types, classes, structures, and more.
##### Swift Struct Deinit
Unlike classes, Swift structs don't have a deinitializer (deinit), and they don’t carry the overhead of reference counting, resulting in improved performance. A struct does not have a deinit method because its instance variables refer to value types. When the struct instance is removed from the stack, its instance variables are also removed.
#### Class vs Struct Swift: When to Use Which?
The choice between using class or struct often depends on the specific requirements of your coding project.

As an overarching guideline, remember the key principle: structs are value types and classes are reference types. If you’re passing something around your application that needs to stay the same instance, use a class. If you just need to model complex data and make computation faster, a struct would be a suitable choice.

Swift encourages the use of value types through structs, with safe and predictable behavior through copy semantics. However, classes introduce powerful possibilities of inheritance, allowing for more complex behavior if needed.

It's essential to understand the difference between these two types since Swift is increasingly leveraging the benefits of both to offer an excellent balance of object-oriented and functional paradigms.