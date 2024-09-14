//
//  SearchOptionView.swift
//  NearMe
//
//  Created by ThienTran on 15/9/24.
//

import Foundation
import SwiftUI

struct SearchOptionView:View {
  let searchOptions = ["Restaurants": "fork.knife", "Hotels": "bed.double.fill", "Coffee": "cup.and.saucer.fill", "Gas": "fuelpump.fill"]
  let onSelected: (String) -> Void
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(searchOptions.sorted(by: >), id: \.0) { key, value in
          Button {
            onSelected(key)
          } label: {
            Image(systemName: value)
            Text(key)
          }
          .buttonStyle(.borderedProminent)
          .tint(Color(red: 236/255, green: 240/255, blue: 241/255, opacity: 1.0))
          .foregroundStyle(.black)
          .padding(4)
        }
      }
    }
  }

}


#Preview {
  SearchOptionView(onSelected: {_ in })
}
