//
//  NavigationSplitWithData.swift
//  NavigationSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct NavigationSplitWithData: View {
  let items = ["Item 1", "Item 2", "Item 3"]

      @State private var selectedItem: String?

      var body: some View {
          NavigationSplitView {
              List(items, id: \.self, selection: $selectedItem) { item in
                  Text(item)
              }
              .navigationTitle("Items")
          } detail: {
              if let selectedItem = selectedItem {
                DetailViewSplitData(item: selectedItem)
              } else {
                  Text("Select an item")
              }
          }
      }
}

struct DetailViewSplitData: View {
    let item: String

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}

#Preview {
    NavigationSplitWithData()
}
