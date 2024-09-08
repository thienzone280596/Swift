//
//  MoviesApp.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import SwiftUI
import SwiftData

@main
struct MoviesApp: App {
  let container:ModelContainer
  init() {
    do {
      container = try ModelContainer(for: Movie.self, migrationPlan: MoviesMigrationPlan.self, configurations: ModelConfiguration(for: Movie.self))
    } catch {
      fatalError("Could not init Container")
    }
  }

    var body: some Scene {
        WindowGroup {
          NavigationStack {
            MovieListScreen()
          }
        } .modelContainer(container)
    }
}
