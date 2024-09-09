//
//  Movie.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import Foundation
import SwiftData

@Model
final class Movie {

    var title: String
    var year: Int
    var genreId: Int

    var genre: Genre {
      Genre(rawValue: genreId) ?? .action
    }

    @Transient var reviewsCount: Int {
        reviews.count
    }

    @Transient var actorsCount: Int {
        actors.count
    }

    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews: [Review] = []

    @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
    var actors: [Actor] = []

    init(title: String, year: Int, genre: Genre) {
        self.title = title
        self.year = year
      self.genreId = genre.id
    }
}


