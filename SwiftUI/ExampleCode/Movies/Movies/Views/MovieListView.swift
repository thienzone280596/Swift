//
//  MovieListView.swift
//  Movies
//
//  Created by ThienTran on 3/9/24.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
  let filterOption:FilterOption
  @Query private var movies:[Movie]

  init(filterOption: FilterOption = .none) {
    self.filterOption = filterOption
    switch self.filterOption {
    case .title(let movieTitle):
      _movies = Query(filter: #Predicate{ $0.title.contains(movieTitle)})
    case .none:
      _movies = Query()
    case .reviewsCount(let numberOfReview):
      _movies = Query(filter: #Predicate{$0.reviews.count > numberOfReview})
    }
  }
//    let movies: [Movie]
    @Environment(\.modelContext) private var context

    private func deleteMovie(indexSet: IndexSet) {

        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }

    }

  var body: some View {
      List {
          ForEach(movies) { movie in
              NavigationLink(value: movie) {

                  HStack(alignment: .firstTextBaseline) {
                      VStack(alignment: .leading) {
                          Text(movie.title)
                        Text(movie.genre.title)
                          .font(.caption)
                          Text("Number of reviews: \(movie.reviewsCount)")
                              .font(.caption)
                          Text("Number of actors: \(movie.actorsCount)")
                              .font(.caption)

                      }
                      Spacer()
                      Text(movie.year.description)
                  }

              }
          }.onDelete(perform: deleteMovie)
      }.navigationDestination(for: Movie.self) { movie in
          MovieDetailScreen(movie: movie)
      }
  }
}

#Preview {
  MovieListView(filterOption: .none)
        .modelContainer(for: [Movie.self])
}
