//
//  CustomListRow.swift
//  ListSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI
struct FruitRow: View {
  let fruit: Fruit

  var body: some View {
    HStack {
      Image(systemName: "applelogo")
      Text(fruit.name)
    }
  }
}


struct CustomListRow: View {
  let fruits = [
         Fruit(name: "Apple"),
         Fruit(name: "Banana"),
         Fruit(name: "Orange"),
         Fruit(name: "Grapes"),
         Fruit(name: "Strawberry")
     ]

    var body: some View {
      List(fruits) { fruit in
                 FruitRow(fruit: fruit)
             }
    }
}

#Preview {
    CustomListRow()
}
