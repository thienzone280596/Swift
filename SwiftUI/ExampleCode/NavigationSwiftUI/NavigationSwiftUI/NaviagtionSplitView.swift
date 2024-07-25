//
//  NaviagtionSplitView.swift
//  NavigationSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct NaviagtionSplitView: View {
  var body: some View {
         NavigationSplitView {
             SidebarView()
         } detail: {
           DetailViewSplitView()
         }
     }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink("Item 1", destination: DetailViewSplitView(item: "Item 1"))
            NavigationLink("Item 2", destination: DetailViewSplitView(item: "Item 2"))
            NavigationLink("Item 3", destination: DetailViewSplitView(item: "Item 3"))
        }
        .navigationTitle("Sidebar")
    }
}

struct DetailViewSplitView: View {
    var item: String = "Detail"

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}


#Preview {
    NaviagtionSplitView()
}
