//
//  BasicListView.swift
//  ListSwiftUI
//
//  Created by ThienTran on 23/7/24.
//

import SwiftUI

struct BasicListView: View {
  let fruits = ["Apple", "Banana", "Orange", "Grapes", "Strawberry"]

    var body: some View {
      List(fruits, id: \.self) {
        fruit in
        Text(fruit)
      }
    }
}

#Preview {
    BasicListView()
}
