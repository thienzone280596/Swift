//: [Previous](@previous)

import Foundation
import Combine

enum NumberError:Error {
  case operationFailed
}

let numberPublisher = [1,2,3,4,5].publisher

//let doublePublisher = numberPublisher
//  .tryMap { number in
//  if number == 4 {
//    throw NumberError.operationFailed
//  }
//
//  return number * 2
//}.catch { error in
//  if let numberError = error as? NumberError {
//    print("error occured \(numberError)")
//  }
//  return Just(0)
//}
//
//let cancelable = numberPublisher.sink { completion in
//  switch completion {
//
//  case .finished:
//    print("fininsh")
//  case .failure(let error):
//    print(error)
//  }
//} receiveValue: { value in
//  print(value)
//}

let doublePublisher = numberPublisher.tryMap { number in
  if number == 4 {
    throw NumberError.operationFailed
  }
  return number * 2
}
  .mapError { error in
    if let numberError = error as? NumberError {
      return NumberError.operationFailed
    }
    return NumberError.operationFailed
  }

let cancelable = doublePublisher.sink { completion in
    switch completion {
    case .finished:
      print("fininsh")
    case .failure(let error):
      print(error)
    }
} receiveValue: { value in
  print(value)
}

