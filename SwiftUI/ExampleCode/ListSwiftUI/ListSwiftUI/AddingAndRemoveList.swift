//
//  AddingAndRemoveList.swift
//  ListSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct AddingAndRemoveList: View {
  @State private var fruits = ["Apple", "Banana", "Orange", "Grapes", "Strawberry"]

     var body: some View {
         NavigationView {
             List {
                 ForEach(fruits, id: \.self) { fruit in
                     Text(fruit)
                 }
                 .onDelete(perform: delete)
                 .onMove(perform: move)
             }
             .navigationBarTitle("Fruits")
             .navigationBarItems(
                 leading: EditButton(),
                 trailing: Button(action: addFruit) {
                     Image(systemName: "plus")
                 }
             )
         }
     }

     func delete(at offsets: IndexSet) {
         fruits.remove(atOffsets: offsets)
     }

     func move(from source: IndexSet, to destination: Int) {
         fruits.move(fromOffsets: source, toOffset: destination)
     }

     func addFruit() {
         fruits.append("New Fruit")
     }
}

#Preview {
    AddingAndRemoveList()
}
