//
//  AddMovieScreen.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context

  @State private var title:String = ""
  @State private var year:Int?
  @State private var selectActors:Set<Actor> = []

  private var isFormValid:Bool {
    return !title.isEmptyOrWhiteSpace && year != nil && !selectActors.isEmpty
  }

  private func saveMovie() {
    guard let year = year else { return }
    let movie = Movie(title: title, year: year)
    movie.actors = Array(selectActors)

    selectActors.forEach { actor in
      actor.movies.append(movie)
      context.insert(actor)

    }
    context.insert(movie)
    do {
      try context.save()
      self.title = ""
      self.year = nil
      dismiss()
    } catch {
      print(error)
    }


  }

  var body: some View {
     // TODO: - form
    Form {
      TextField("Title", text: $title)
      TextField("Year", value: $year, format: .number)
      Section("Select Actor") {
        ActorSelectionView(selectedActors: $selectActors)
      }
    }
    .onChange(of: selectActors, {
      print(selectActors.count)
    })
    .toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Text("Close")
        }

      }
      ToolbarItem(placement: .topBarTrailing) {
        Button {
          saveMovie()
        } label: {
          Text("Save")
        }.disabled(!isFormValid)

      }
    })

  }
}

#Preview {
  NavigationStack {
    AddMovieScreen()
      .modelContainer(for: [Movie.self])
  }
}
