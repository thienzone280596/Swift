//: [Previous](@previous)

import Foundation
import Combine

 // TODO: - Map, FlatMap, Merge
//let numberPublisher = (1...5).publisher
//
// // TODO: - Map
//let squaredPublisher = numberPublisher.map{$0 * $0}
//
//let cancelable = squaredPublisher.sink { value in
//  print(value)
//}
 // TODO: - flatmap
//let namePublisher = ["john", "mary", "steven"].publisher
//
//let flatedNamePublisher = namePublisher.flatMap { name in
//  name.publisher
//}
//
//let cancelable = flatedNamePublisher.sink { value in
//  print(value)
//}
 // TODO: - Merge
let publisher1 = [1,2,3].publisher
let publisher2 = [4,5,6].publisher

let mergePublisher = Publishers.Merge(publisher1, publisher2)
let cancelable = mergePublisher.sink { value in
  print(value)
}

