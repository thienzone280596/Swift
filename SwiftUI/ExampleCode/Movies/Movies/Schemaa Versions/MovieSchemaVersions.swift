//
//  MovieSchemaVersions.swift
//  Movies
//
//  Created by ThienTran on 7/9/24.
//

import Foundation
import SwiftData

enum MovieSchemaV1:VersionedSchema {
  static var versionIdentifier: Schema.Version = Schema.Version(1,0,0 )

  static var models: [any PersistentModel.Type] {
    [Movie.self]
  }

  @Model
  class Movie {
    //thuoc tinh doc nhat (chi co 1)   @Attribute(.unique)
    @Attribute(.unique) var title: String
    var year: Int

    @Relationship(deleteRule:.cascade, inverse: \Review.movie)
    var reviews:[Review] = []

    @Relationship(deleteRule:.nullify, inverse: \Actor.movies)
    var actors: [Actor] = []
    @Transient var reviewCount:Int {
      reviews.count
    }

    @Transient var actorCount:Int {
      actors.count
    }

    init(title: String, year: Int) {
      self.title = title
      self.year = year
    }
  }
}

enum MoviesSchemaV2: VersionedSchema {

  static var versionIdentifier: Schema.Version = Schema.Version(2,0,0 )

    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }

    @Model
    final class Movie {

        @Attribute(.unique) var title: String
        var year: Int

        var reviewsCount: Int {
            reviews.count
        }

        var actorsCount: Int {
            actors.count
        }

      @Relationship(deleteRule:.cascade, inverse: \Review.movie)
        var reviews: [Review] = []

      @Relationship(deleteRule:.nullify, inverse: \Actor.movies)
        var actors: [Actor] = []

        init(title: String, year: Int) {
            self.title = title
            self.year = year
        }
    }

}
