//
//  NavigationStackWithData.swift
//  NavigationSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct NavigationStackWithData: View {
  let items = ["Item 1", "Item 2", "Item 3"]

   var body: some View {
       NavigationStack {
           List(items, id: \.self) { item in
               NavigationLink(item, value: item)
           }
           .navigationDestination(for: String.self) { item in
             DetailViewData(item: item)
           }
           .navigationTitle("Items")
       }
   }
}

struct DetailViewData: View {
    let item: String

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}

#Preview {
    NavigationStackWithData()
}
