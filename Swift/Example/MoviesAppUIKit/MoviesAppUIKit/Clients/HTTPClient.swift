//
//  HTTPClient.swift
//  MoviesAppUIKit
//
//  Created by ThienTran on 15/8/24.
//

import Foundation
import Combine

enum NetworkError:Error {
  case badUrl
}


class HTTPClient {
   // TODO: - fetch Movie
  func fetchMovie(search:String) -> AnyPublisher<[Movie], Error> {

    guard let encodedSearch =  search.urlEncoded,
          let url = URL(string: "https://www.omdbapi.com/?s=\(encodedSearch)&page=2&apikey=5970afa6") else {
      return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: MovieResponse.self, decoder: JSONDecoder())
      .map(\.Search)
      .receive(on: DispatchQueue.main)
      .catch { error -> AnyPublisher<[Movie],Error> in
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()
  }
}
