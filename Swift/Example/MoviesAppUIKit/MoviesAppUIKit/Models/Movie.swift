//
//  Movie.swift
//  MoviesAppUIKit
//
//  Created by ThienTran on 15/8/24.
//

import Foundation

// MARK: - Welcome
struct MovieResponse: Decodable {
    let Search: [Movie]

    enum CodingKeys: String, CodingKey {
        case Search = "Search"
    }
}


struct Movie: Decodable {
  let title:String
  let year: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"

    }
}
