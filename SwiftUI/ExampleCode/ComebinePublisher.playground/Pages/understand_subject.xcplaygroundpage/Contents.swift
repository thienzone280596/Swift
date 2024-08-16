//: [Previous](@previous)

import Combine

//let passthroughSubject = PassthroughSubject<String, Never>()
//
//let subscriber1 = passthroughSubject.sink { value in
//    print("Subscriber 1 received: \(value)")
//}
//
//passthroughSubject.send("Hello")
//// Output: "Subscriber 1 received: Hello"
//
//let subscriber2 = passthroughSubject.sink { value in
//    print("Subscriber 2 received: \(value)")
//}
//
//passthroughSubject.send("World")
//// Output: "Subscriber 1 received: World"
// Output: "Subscriber 2 received: World"
let currentValueSubject = CurrentValueSubject<String, Never>("Initial Value")

let subscriber1 = currentValueSubject.sink { value in
    print("Subscriber 1 received: \(value)")
}
// Output: "Subscriber 1 received: Initial Value"

currentValueSubject.send("Hello")
// Output: "Subscriber 1 received: Hello"

let subscriber2 = currentValueSubject.sink { value in
    print("Subscriber 2 received: \(value)")
}
// Output: "Subscriber 2 received: Hello"

currentValueSubject.send("World")
// Output: "Subscriber 1 received: World"
// Output: "Subscriber 2 received: World"
