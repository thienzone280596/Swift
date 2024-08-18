//
//  MoviesSwiftUITests.swift
//  MoviesSwiftUITests
//
//  Created by ThienTran on 17/8/24.
//

import XCTest
import Combine

final class MoviesSwiftUITests: XCTestCase {
  private var cancelables: Set<AnyCancellable> = []
    func testFetchMovies() throws {
      let httpClient = HTTPClient()
      let expection = XCTestExpectation(description: "Received movies")
      httpClient.fetchMovies(search: "Batman")
        .sink { completion in
          switch completion {
          case .finished:
            break
          case .failure(let error):
            XCTFail("Request Fail with error \(error)")
          }
        } receiveValue: { movies in
          XCTAssertTrue(movies.count > 0)
          expection.fulfill()
        }
        .store(in: &cancelables)
      wait(for: [expection], timeout: 5.0)
    }



}
