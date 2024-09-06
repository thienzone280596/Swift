//
//  ActorDetailScreen.swift
//  Movies
//
//  Created by ThienTran on 5/9/24.
//

import SwiftUI

struct ActorDetailScreen: View {
  let actor:Actor
  @Environment(\.modelContext) private var context
  @State private var selectedMovie:Set<Movie> = []

    var body: some View {
      VStack {
        MovieSelectionView(selectedMovie: $selectedMovie)
          .onAppear{
            selectedMovie = Set(actor.movies)
          }
      }
      .onChange(of: selectedMovie, {
        actor.movies = Array(selectedMovie)
        context.insert(actor)
      })
      .navigationTitle(actor.name)


    }
}

//
//#Preview {
//    ActorDetailScreen()
//}
