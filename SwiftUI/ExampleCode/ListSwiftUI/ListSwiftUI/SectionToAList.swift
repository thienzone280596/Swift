//
//  SectionToAList.swift
//  ListSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct SectionToAList: View {
  let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Grapes"),
        Fruit(name: "Strawberry")
    ]
    let vegetables = [
        Fruit(name: "Carrot"),
        Fruit(name: "Potato"),
        Fruit(name: "Tomato")
    ]

    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                ForEach(fruits) { fruit in
                    Text(fruit.name)
                }
            }

            Section(header: Text("Vegetables")) {
                ForEach(vegetables) { vegetable in
                    Text(vegetable.name)
                }
            }
        }
    }
}

#Preview {
    SectionToAList()
}
