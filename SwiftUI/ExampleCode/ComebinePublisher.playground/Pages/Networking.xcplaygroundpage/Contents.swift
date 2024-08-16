//: [Previous](@previous)

import Foundation
import Combine
 // TODO: - Object
struct Post:Codable {
  let userId: Int
  let id:Int
  let title:String
  let body:String
}

enum NetworkError:Error {
  case badErrorResponse
}


func fetchPost() -> AnyPublisher<[Post], Error> {
  let url = URL(string: "https://jsonplaceholder.typicode.com/postss")!

  return URLSession.shared.dataTaskPublisher(for: url)
    .tryMap({ data, response in
      guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
        throw NetworkError.badErrorResponse
      }
      return data
    })
    .decode(type: [Post].self, decoder: JSONDecoder())
    .retry(3)
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
}

var cancelables: Set<AnyCancellable> = []

fetchPost()
  .sink { completion in
    switch completion {
    case .finished:
      print("Update UI")
    case .failure(let error):
      print(error)
    }
  } receiveValue: { posts in
    print(posts)
  }
  .store(in: &cancelables)

