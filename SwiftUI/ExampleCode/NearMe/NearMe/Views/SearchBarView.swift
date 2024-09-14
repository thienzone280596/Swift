//
//  SearchBarView.swift
//  NearMe
//
//  Created by ThienTran on 15/9/24.
//

import SwiftUI

struct SearchBarView: View {
  @Binding var search:String
  @Binding var searching:Bool
    var body: some View {
      VStack(spacing: -10) {
        TextField("Search", text: $search)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onSubmit {
                searching = true
            }
      SearchOptionView {searchTerm in
        search = searchTerm
        searching = true
      }
      .padding([.leading], 10)
      .padding([.bottom], 20)
      }

    }
}

#Preview {
  SearchBarView(search: .constant("Coffee"), searching: .constant(false))
}
