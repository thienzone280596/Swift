//
//  MoviesApp.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            MovieListScreen()
          }
        } .modelContainer(for: [Movie.self])
    }
}
