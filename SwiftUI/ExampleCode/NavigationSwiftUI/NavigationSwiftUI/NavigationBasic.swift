//
//  NavigationBasic.swift
//  NavigationSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct NavigationBasic: View {
    var body: some View {
      NavigationStack {
                VStack {
                    NavigationLink("Go to Detail View", destination: DetailView())
                        .navigationTitle("Home")
                }
            }
    }
}

#Preview {
    NavigationBasic()
}
