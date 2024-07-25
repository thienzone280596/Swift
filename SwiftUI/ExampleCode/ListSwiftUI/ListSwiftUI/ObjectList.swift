//
//  ObjectList.swift
//  ListSwiftUI
//
//  Created by ThienTran on 24/7/24.
//

import SwiftUI

struct ObjectList: View {
  let fruits = [
       Fruit(name: "Apple"),
       Fruit(name: "Banana"),
       Fruit(name: "Orange"),
       Fruit(name: "Grapes"),
       Fruit(name: "Strawberry")
   ]

   var body: some View {
       List(fruits) { fruit in
           Text(fruit.name)
       }
   }
}

#Preview {
    ObjectList()
}
