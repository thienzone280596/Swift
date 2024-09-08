//
//  MoviesMigrationPlan.swift
//  Movies
//
//  Created by ThienTran on 8/9/24.
//

import Foundation
import SwiftData

enum MoviesMigrationPlan:SchemaMigrationPlan {
  static var schemas: [any VersionedSchema.Type] {
    [MovieSchemaV1.self, MoviesSchemaV2.self]
  }

  static var stages: [MigrationStage] {
      []
  }

  static let migrateV1toV2 = MigrationStage.custom(fromVersion: MovieSchemaV1.self, toVersion: MoviesSchemaV2.self, willMigrate: { context in
    guard let movies = try? context.fetch(FetchDescriptor<Movie>()) else {
      return
    }

    var duplicate = Set<Movie>()
    var uniqueSet = Set<String>()

    for movie in movies {
      if !uniqueSet.insert(movie.title).inserted {
        duplicate.insert(movie)
      }
    }

    for movie in duplicate {
      guard let movieTobeUpdated = movies.first(where: {$0.id == movie.id}) else { continue }
      movieTobeUpdated.title = movieTobeUpdated.title + "\(UUID().uuidString)"
    }

    try? context.save()
  }, didMigrate: nil)

}
