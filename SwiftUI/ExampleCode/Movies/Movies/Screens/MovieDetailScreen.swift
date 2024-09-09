//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by ThienTran on 3/9/24.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  @State private var showReviewScreen:Bool = false

  let movie:Movie
  @State private var title:String = ""
  @State private var year: Int?

    var body: some View {
      Form {
        TextField("Title", text: $title)
        TextField("Year", value: $year, format: .number)
        Button {
          guard let year = year else { return }
          movie.name = title
          movie.year = year
          do {
            try context.save()
            dismiss()
          } catch {
            print(error.localizedDescription)
          }
        } label: {
          Text("Update")
        }
        Section("Reviews") {
          Button {
            self.showReviewScreen = true
          } label: {
            Image(systemName: "plus")
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          if movie.reviews.isEmpty {
            ContentUnavailableView{
              Text("No Result")
            }
          } else {
            ReviewListView(movie: movie)
          }
        }
        Section("Actors") {
          if movie.actors.isEmpty {
            ContentUnavailableView{
              Text("No Result")
            }
          } else {
            List(movie.actors) { actor in
              ActorCellView(actor: actor)
            }
          }
        }
      }
      .onAppear(perform: {
        title = movie.name
        year = movie.year
      })
      .sheet(isPresented: $showReviewScreen, content: {
        NavigationStack {
          AddReviewScreen(movie: movie)
        }
      })
    }
}

struct MovieDetailContainerScreen: View {

    @Environment(\.modelContext) private var context
    @State private var movie: Movie?

    var body: some View {
        ZStack {
            if let movie {
                MovieDetailScreen(movie: movie)
            }
        }
            .onAppear {
                movie = Movie(name: "Spiderman", year: 2023)
                context.insert(movie!)
            }
    }
}


#Preview {
  MovieDetailContainerScreen()
    .modelContainer(for: [Movie.self])
}
