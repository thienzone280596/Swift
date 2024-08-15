//
//  MovieListViewModel.swift
//  MoviesAppUIKit
//
//  Created by ThienTran on 15/8/24.
//

import Foundation
import Combine

class MovieListViewModel {
  @Published private(set) var movies:[Movie] = []
  private let httpClient:HTTPClient
  private var cancelables:Set<AnyCancellable> = []
  private var searchSubject = CurrentValueSubject<String, Never>("")


  @Published var loadingCompleted:Bool = false

  init(httpClient: HTTPClient) {
    self.httpClient = httpClient
    setupSearchPublisher()
  }

  private func setupSearchPublisher() {
    searchSubject
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .sink { searchText in
      self.loadMovies(search: searchText)
    }
    .store(in: &cancelables)
  }

  func setSearchText(_ searchText:String) {
    searchSubject.send(searchText)
  }

  func loadMovies(search:String) {
    httpClient.fetchMovie(search: search)
      .sink { completion in
        switch completion {
        case .finished:
          print("Finish")
          self.loadingCompleted = true
        case .failure(let error):
          print(error)
        }
      } receiveValue: {[weak self] movies in
        self?.movies = movies
      }
      .store(in: &cancelables)

  }

}
