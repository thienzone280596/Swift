//: [Previous](@previous)

import Foundation
import Combine

let timerPublisher = Timer.publish(every: 1, on: .main , in: .common)
let cancelable = timerPublisher.autoconnect().sink { time in
  print(time)
}
