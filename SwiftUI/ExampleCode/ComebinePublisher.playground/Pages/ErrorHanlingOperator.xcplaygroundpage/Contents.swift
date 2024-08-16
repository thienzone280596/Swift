//: [Previous](@previous)

import Foundation
import Combine


enum SamlpleError:Error {
  case operationFailed
}

 // TODO: - tryMap, catch
//let numberPublisher = [1,2,3,4,5,6].publisher
//
//let transformedPublisher = numberPublisher.tryMap { value in
//  if value == 3 {
//    throw SamlpleError.operationFailed
//  }
//  return value
//}
//  .catch { error in
//    print(error)
//    return Just(0)
//  }
//
//
//let cancelable = transformedPublisher.sink { value in
//  print(value)
//}

 // TODO: -replace Error

