//: [Previous](@previous)

import Foundation
import Combine

extension Publisher where output == Int {
  func filterEventNumber() -> AnyPublisher<Int,Failure> {
    return self.filter{ $0 % 2 == 0}
      .eraseToAnyPublisher()
  }

//  func filterNumberGreaterThan(_ value:Int) -> AnyPublisher<Int,Failure> {
//    return self.filter{ $0 > value }
//      .eraseToAnyPublisher()
//  }
}

let publisher = [1,2,3,4,5,6,7,8].publisher

//publisher.filterEventNumber()
//  .sink { value in
//    print(value)
//  }
//
//let _ = publisher
//  .filterNumberGreaterThan(5)
//  .sink { value in
//    print( value)
//  }
