//
//  TagView.swift
//  BudgetApp
//
//  Created by ThienTran on 26/8/24.
//

import SwiftUI

struct TagView: View {
  @FetchRequest(sortDescriptors: []) private var tags: FetchedResults<Tag>
  @Binding var selectedTags:Set<Tag>

    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(tags) {
            tag in
            Text(tag.name ?? "")
              .padding()
              .background(selectedTags.contains(tag) ? .blue:.gray)
              .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
              .onTapGesture {
                if selectedTags.contains(tag) {
                  selectedTags.remove(tag)
                } else {
                  selectedTags.insert(tag)
                }
              }
          }
        }
        .foregroundStyle(.white)
      }
    }
}

struct TagViewContainer:View {
  @State private var selectedTags:Set<Tag> = []
  var body: some View {
    TagView(selectedTags: $selectedTags)
      .environment(\.managedObjectContext, CoreDataProvider.preview.context)
  }
}

#Preview {
  TagViewContainer()
}
