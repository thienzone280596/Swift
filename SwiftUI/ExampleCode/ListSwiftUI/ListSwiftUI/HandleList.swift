//
//  HandleList.swift
//  ListSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct FruitDetailView: View {
    let fruit: Fruit

    var body: some View {
        Text("You selected \(fruit.name)")
            .font(.largeTitle)
    }
}

struct HandleList: View {

  let fruits = [
         Fruit(name: "Apple"),
         Fruit(name: "Banana"),
         Fruit(name: "Orange"),
         Fruit(name: "Grapes"),
         Fruit(name: "Strawberry")
     ]

  var body: some View {
         NavigationView {
             List(fruits) { fruit in
                 NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                     Text(fruit.name)
                 }
             }
             .navigationTitle("Fruits")
         }
     }
}

#Preview {
    HandleList()
}
