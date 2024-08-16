//: [Previous](@previous)

import Foundation
import Combine

let baseURL = "https://www.omdbapi.com/?s=Batman&page=2&apikey=5970afa6"

struct MovieResponse:Decodable {
  let search: [Movie]
}

struct Movie: Decodable {
  let title:String

  private enum CodingKeys:String, CodingKey {
    case title = "Title"
  }
}

func searchMovies(_ searchTerm:String) -> AnyPublisher<MovieResponse, Error> {
  let url = URL(string: "https://www.omdbapi.com/?s=\(searchTerm)&page=2&apikey=5970afa6")!

  return URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .decode(type: MovieResponse.self, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
}

var cancelables:Set<AnyCancellable> = []

Publishers.CombineLatest(searchMovies("Batman"),searchMovies("Spiderman"))
  .sink { _ in
    print("kjsdk")
  } receiveValue: { value1, value2 in
    print(value1.search)
    print(value2.search)
  }
  .store(in: &cancelables)

