## Generic in Swift

Generics in Swift allows you to write generic and reusable code, avoiding duplication. A generic type or function creates constraints for the current scope, requiring input values to conform to these requirements.

You’ve probably been using generic implementations already since they’re all over the place in the Swift standard library. Though, using them in your implementation might still be scary since generics can look complex and hard to write. Writing generic code requires a certain mindset to generalize functions to make them reusable
(Generics là một trong những tính năng mạnh mẽ nhất trong Swift programming language. Nhưng tuy nhiên sẽ hơi khó hiểu lúc mới bắt đầu. Trong bài viết này chúng ta sẽ xem cách mà generics hoạt động trong Swift, và những điều thú vị bạn có thể làm với nó.)
#### How to use generics in Swift
You can write generics in Swift to make existing code more reusable. A classic example is the one using a stack of elements, better known as an array in Swift:
```Swift
struct IntStack {
    var items: [Int] = []

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }
}
```
In this example, we’ve created a stack of integers. We can push and pop elements, but they all have to conform to integers. A stack with support for integers only might be good at first for you to keep around in your project. However, we’ll start duplicating code as soon as we need a stack of strings:
```Swift
struct StringStack {
    var items: [String] = []

    mutating func push(_ item: String) {
        items.append(item)
    }

    mutating func pop() -> String {
        return items.removeLast()
    }
}
```
Both IntStack and StringStack have similar code implementations, resulting in code duplication and multiple types to maintain. Indicating duplicate code can be a great moment to consider rewriting your logic by making use of generics:

```Swift
struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}
```
#### Creating generic methods
The above stack examples make use of generics on the type level. We can use generics within methods as well, like in the following print example:
```Swift
func printElement<T: CustomStringConvertible>(_ element: T) {
    print(element)
}
```

Note that we introduced the concept of constraints in this example. An element passed into the print method must conform to the CustomStringConvertible protocol, allowing us to convert the element to a string before printing.

You can also write the above method using a where clause:
```Swift
func printElement<T>(_ element: T) where T: CustomStringConvertible {
    print(element)
}
```
#### Opaque types as a shorthand for generics
You can use opaque types instead of generics whenever you’re using generics in a single place. The above print method uses the generic T only within the method definition, and you can therefore rewrite it as follows:

```Swift
func printElement(_ element: some CustomStringConvertible) {
    print(element.description)
}
```
#### Using generic return types
You can also use generics as return types. For example, we could create a method to convert any element into an array:
```Swift
func convertToArray<T>(_ element: T) -> [T] {
    return [element]
}

let name = "Antoine"
let arrayOfNames = convertToArray(name)
```
#### Creating protocol extensions using constraints
Protocol extensions allow you to set up constraints using the associated type. For example, we can create an extension for an array of strings as follows:
```Swift
extension Array where Element == String {
    func uppercaseAll() -> [Element] {
        map { $0.uppercased() }
    }
}

["Bernie", "Jaap", "Lady"].uppercaseAll() // Will be: ["BERNIE", "JAAP", "LADY"]
```
