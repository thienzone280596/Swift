//
//  ActorListView.swift
//  Movies
//
//  Created by ThienTran on 4/9/24.
//

import SwiftUI
import SwiftData

struct ActorListView: View {
  let actors:[Actor]

    var body: some View {
      List(actors) { actor in
        NavigationLink(value: actor) {
          ActorCellView(actor: actor)
        }
      }
      .navigationDestination(for: Actor.self) { actor in
        ActorDetailScreen(actor: actor)
      }
    }
}

#Preview {
  ActorListView(actors: [])
}
