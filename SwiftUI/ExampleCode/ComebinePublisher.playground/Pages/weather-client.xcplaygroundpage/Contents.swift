//: [Previous](@previous)

import Foundation
import Combine

class WeatherClient {
   let update = PassthroughSubject<Int,Never>()

  func fetchWeather() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      [weak self] in
      self?.update.send(Int.random(in: 32...100))
    }
  }
}

let client = WeatherClient()
let cancelable = client.update.sink { value in
  print(value)
}

client.fetchWeather()
