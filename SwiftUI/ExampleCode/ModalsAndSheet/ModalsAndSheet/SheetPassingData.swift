//
//  SheetPassingData.swift
//  ModalsAndSheet
//
//  Created by ThienTran on 25/7/24.
//

import SwiftUI

struct SheetPassingData: View {
  @State private var isShowingSheet = true
    @State private var selectedItem: String?

    var body: some View {
        VStack {
            Button("Show Sheet with Item") {
                selectedItem = "Item 1"
              isShowingSheet.toggle()
            }
            .sheet(isPresented: $isShowingSheet) {
                if let item = selectedItem {
                  SheetViewData(item: item)
                }
            }
        }
    }
}

struct SheetViewData: View {
  var item: String

     var body: some View {
         Text("Showing details for \(item)")
             .padding()
     }
}

#Preview {
    SheetPassingData()
}
