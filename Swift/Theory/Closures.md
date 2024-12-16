## Closures

#### 1. What is Closures
Closures can capture and store references to any constants and variables from the context in which they are defined. A closure is a function without a name, and it captures any value in its environment. Functions and closures are first-class objects in Swift, which means we can store them, pass them as arguments to functions, and treat them the same way we would any other value or object. Passing closures as completion handlers is a common practice in APIs. The Standard Swift library uses closures mostly for event handling and callbacks.
#### 2. What is the Function ?
Functions are encapsulated pieces of code that perform a specific task. We need to give the function a name that closely follows its function, and use this name to call the function when needed. Functions can have zero or many parameters, and return many or nothing.
```Swift
func sumOf(_ a: Int, _ b: Int) -> Int {
    return a + b
}
```
#### 3. Function Types
Function type is created by the param type and return type of that function. As in the above example, its function type is (Int, Int) -> Int

Function type can be used as param or return type of a function, and it is assigned to a variable as follows:
```Swift
var mathFunction: (Int, Int) -> Int = sumOf
```
Functions are a special case of closures. Closures come in three forms:
* Global functions: Have a name and cannot capture values
* Nested functions: Have a name and can capture values ​​from the nested function that contains them
* Closure expressions: Have no name and can capture values ​​from the content around them
#### 4. Closure Expression
A closure is created by placing a function type inside **curly braces (dau ngoac)** and the "in" keyword after the return type:
```Swift
{ (params) -> (returnType) in
    // Statement
}
```

```Swift
// No parameter and return nothing
let sayHello: () -> Void = {
    print("Hello")
}

sayHello()

// Closure take one parameter and return 1 parameter
let value: (Int) -> Int = { (value1) in
    return value1
}
```
#### 5. Abbreviate the name of the argument (Viêt tăt của argument)
Các argument của closure có thể được truy cập bằng cách gọi đến vị trí của chúng, ví dụ như $0, $1, $2..
```Swift
let digitSquare: (Int) -> Int {
    print($0)
    return $0 * $0
}
```
#### 6. Trailing closure
If we need to pass a long closure expression as the last parameter of a function, it can be written as a trailing closure. Trailing closure is written right after the function parenthesis even though it is still a parameter of the function. When using trailing closure, we do not declare a name for this parameter.
```Swift
func sumOf(a: Int, b: Int, onCompletion: (Int) -> Void) {
        let sum = a + b
        onCompletion(sum)
    }
    
    func test() {
        sumOf(a: 10, b: 23, onCompletion: { sum in
            print("Sum is: ", sum)
        })
    }
```
#### 7. Capturing Values
Closures can save constants and variables from the context in which they are defined. The closure can then refer to and change the values ​​of the constants and variables within the closure, even if the original scope that defined them has been released.
```Swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```
