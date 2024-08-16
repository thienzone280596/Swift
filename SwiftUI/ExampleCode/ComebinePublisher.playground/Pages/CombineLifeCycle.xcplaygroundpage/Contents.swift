//: [Previous](@previous)

import Foundation
import Combine

let numberPublisher = (1...10).publisher

let cancelable = numberPublisher.sink { value in
  print(value)
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
  cancelable.cancel()
}
