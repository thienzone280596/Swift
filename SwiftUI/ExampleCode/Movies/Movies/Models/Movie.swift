//
//  Movie.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import Foundation
import SwiftData


@Model
class Movie {
  //thuoc tinh doc nhat (chi co 1)   @Attribute(.unique)
  var title: String
  var year: Int

  @Relationship(deleteRule:.cascade, inverse: \Review.movie)
  var reviews:[Review] = []

  @Relationship(deleteRule:.nullify, inverse: \Actor.movies)
  var actors: [Actor] = []


  init(title: String, year: Int) {
    self.title = title
    self.year = year
  }
}
