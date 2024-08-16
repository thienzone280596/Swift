//: [Previous](@previous)

import Foundation
import Combine

extension Publisher {
  func mapAndFilter<T>(_ transform: @escaping (Output) -> T, _ isIncluded: @escaping (T) -> Bool) -> AnyPublisher<T, Failure> {

      return self
          .map { transform($0) }
          .filter { isIncluded($0) }
          .eraseToAnyPublisher()
  }
}

let publisher = [1,2,3,4,5,6,7,8,9,10].publisher

publisher
  .mapAndFilter({$0 * 3}) {
    value in
    return value % 2 == 0
  }.sink { value in
    print(value)
  }
