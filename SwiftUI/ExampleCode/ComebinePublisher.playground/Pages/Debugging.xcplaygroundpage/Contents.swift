//: [Previous](@previous)

import Foundation
import Combine

let publisher = [1,2,3,].publisher

let _ = publisher
    .handleEvents { _ in
        print("Subscription received")
    } receiveOutput: { value in
        print("receiveOutput")
        print(value)
    } receiveCompletion: { completion in
        print("receiveCompletion")
    } receiveCancel: {
        print("receiveCancel")
    } receiveRequest: { _ in
        print("receiveRequest")
    }
    .map { $0 * 3 }
   // .filter { $0 % 2 == 0 }
    .sink { value in
        print("sink")
        print(value)
    }
