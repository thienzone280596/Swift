//
//  MovieSelectionView.swift
//  Movies
//
//  Created by ThienTran on 5/9/24.
//

import SwiftUI
import SwiftData

struct MovieSelectionView: View {

    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Binding var selectedMovies: Set<Movie>

    var body: some View {
        List(movies) { movie in
            HStack {
                Image(systemName: selectedMovies.contains(movie) ? "checkmark.square": "square")
                    .onTapGesture {
                        if !selectedMovies.contains(movie) {
                            selectedMovies.insert(movie)
                        } else {
                            selectedMovies.remove(movie)
                        }
                    }
                Text(movie.title)
            }
        }
    }
}

//#Preview {
//    MovieSelectionView()
//}
