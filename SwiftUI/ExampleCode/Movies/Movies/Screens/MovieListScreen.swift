//
//  MovieListScreen.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import SwiftUI
import SwiftData

enum Sheets:Identifiable {
    case addMovie
  case addActor
  case showFilter

  var id:Int {
    hashValue
  }
}

struct MovieListScreen: View {
    //truy van
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
  @Query(sort: \Actor.name, order: .forward) private var actors:[Actor]

//  @State private var isAddMoviePresented:Bool = false
//  @State private var isActorPresented:Bool = false
  @State private var actorName:String = ""
  @State private var activeSheet:Sheets?
  @State private var filterOption:FilterOption = .none

  private var isValidActor: Bool {
    return !actorName.isEmptyOrWhiteSpace
  }

  private func saveActor() {
    let actor = Actor(name: actorName)
    context.insert(actor)
    actorName = ""
  }

    var body: some View {
      VStack(alignment:.leading) {
        HStack {
          Text("Movies")
            .font(.largeTitle)
          Spacer()
          Button("Filter") {
            activeSheet = .showFilter
          }
        }
        MovieListView(filterOption: filterOption)

        Text("Actor")
          .font(.largeTitle)
        ActorListView(actors: actors)

      }
      .padding()
      .toolbar(content: {
        ToolbarItem(placement:.topBarLeading) {
          Button("Add Actor") {
            activeSheet = .addActor
           // self.isActorPresented = true
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            activeSheet = .addMovie
            //self.isAddMoviePresented = true
          } label: {
            Text("Add Movie")
          }
        }
      })
      .sheet(item: $activeSheet, content: { activeSheet in
        switch activeSheet {
        case .addMovie:
          NavigationStack {
            AddMovieScreen()
          }
        case .addActor:
          Text("Add Actor")
            .font(.largeTitle)
          TextField("Actor Name", text: $actorName)
            .textFieldStyle(.roundedBorder)
            .presentationDetents([.fraction(0.25)])
            .padding()
          Button("Save") {
            //isActorPresented = false
            saveActor()
              self.activeSheet = nil
          }.disabled(!isValidActor)
        case .showFilter:
          NavigationStack {
            FilterSelectionScreen(filterOption: $filterOption)
          }
        }
      })

//      .sheet(isPresented: $isAddMoviePresented, content: {
//        NavigationStack {
//          AddMovieScreen()
//        }
//      })
//      .sheet(isPresented: $isActorPresented, content: {
//        Text("Add Actor")
//          .font(.largeTitle)
//        TextField("Actor Name", text: $actorName)
//          .textFieldStyle(.roundedBorder)
//          .presentationDetents([.fraction(0.25)])
//          .padding()
//        Button("Save") {
//          isActorPresented = false
//
//          saveActor()
//        }.disabled(!isValidActor)
//      })
    }
}

#Preview {
  NavigationStack {
    MovieListScreen()
      .modelContainer(for: [Movie.self, Review.self, Actor.self], inMemory: true)
  }
}
