import UIKit
import Combine

//let publisher = Just("Hello World")
//let cancelable = publisher.sink { value in
//  print(value)
//}
//cancelable.cancel()

//using Publisher
let numberPublisher = [1,2,3,4,5,6].publisher
let doublePublisher = numberPublisher.map{ $0 * 2}
let cancelable = doublePublisher.sink { value in
  print(value)
}

