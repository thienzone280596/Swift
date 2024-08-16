//: [Previous](@previous)

import Foundation
import Combine

 // TODO: - filter
//let numberPublisher = (1...10).publisher
//let filterNumber = numberPublisher.filter{$0 % 2 == 0}
//let cancelable = filterNumber.sink { value in
//  print(value)
//}
 // TODO: - Compacmap
//let numberpublisher = ["1", "2", "three", "4", "five"].publisher
//let compacMapNumber = numberpublisher.compactMap{Int($0)}
//let cancelable = compacMapNumber.sink { value in
//  print(value)
//}
 // TODO: - debound
let subject = PassthroughSubject<String, Never>()

let debounced = subject
    .debounce(for: .seconds(1), scheduler: RunLoop.main)
    .sink { value in
        print("Received value: \(value)")
    }

subject.send("Hello")
subject.send("Hello, w")
subject.send("Hello, wo")
subject.send("Hello, wor")
subject.send("Hello, world!")
