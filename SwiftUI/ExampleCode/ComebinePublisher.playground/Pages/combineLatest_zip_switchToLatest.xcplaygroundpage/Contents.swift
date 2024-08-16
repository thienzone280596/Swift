//: [Previous](@previous)

import Foundation
import Combine

//let publisher1 = PassthroughSubject<Int, Never>()
//let publisher2 = PassthroughSubject<String, Never>()
//
//let combined = Publishers.CombineLatest(publisher1, publisher2)
//
//combined.sink { value in
//    print("Received: \(value)")
//}
//
//publisher1.send(1)
//publisher2.send("A")
//publisher1.send(2)
//publisher2.send("B")

 // TODO: - zip
//let publisher1 = PassthroughSubject<Int, Never>()
//let publisher2 = PassthroughSubject<String, Never>()
//
//let zipped = Publishers.Zip(publisher1, publisher2)
//
//zipped.sink { value in
//    print("Received: \(value)")
//}
//
//publisher1.send(1)
//publisher2.send("A")
//// Output: Received: (1, "A")
//
//publisher1.send(2)
//publisher2.send("B")
// Output: Received: (2, "B")
 // TODO: -
let subject1 = PassthroughSubject<Int, Never>()
let subject2 = PassthroughSubject<Int, Never>()
let outerSubject = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()

let switched = outerSubject.switchToLatest()

switched.sink { value in
    print("Received: \(value)")
}

outerSubject.send(subject1)
subject1.send(1)
// Output: Received: 1

outerSubject.send(subject2)
subject2.send(2)
subject1.send(3)
subject2.send(4)
