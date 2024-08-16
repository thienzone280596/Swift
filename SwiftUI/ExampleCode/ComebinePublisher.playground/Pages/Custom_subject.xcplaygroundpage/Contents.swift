//: [Previous](@previous)

import Foundation
import Combine
import UIkit


class EventSubject<Failure, Error>: Subject {
  typealias  output = Int

  private let wrapperd:PassthroughSubject<Int,Failure>

  init(initialValue:Int) {
    wrapperd = PassthroughSubject()
    let eventInitialValue = initialValue % 2 == 0 ? initialValue : 0
    send(initialValue)
  }

  func send(subscrption:Subscription) {
    wrapperd.send(subscription: subscrption)
  }

  func send(_ value:Int) {
    wrapperd.send(value)
  }

  func send(completion:Subscribers.Completion<Failure>) {
    wrapperd.send(completion: completion)
  }

  func recive<S> (subscriber:S) where S:Subscriber, Failure == S.Failure , Int == S.Input {
    wrapperd.receive(subscriber: subscriber)
  }
}

let subject = EventSubject<Never>(initialValue: 4)
let cancelable = subject.sink { value in
  print(value)
}
