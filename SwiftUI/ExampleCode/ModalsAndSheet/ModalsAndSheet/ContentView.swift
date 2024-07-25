//
//  ContentView.swift
//  ModalsAndSheet
//
//  Created by ThienTran on 25/7/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isShowingSheet = false

    var body: some View {
        VStack {
          Button("Show Sheet") {
                      isShowingSheet.toggle()
                  }
                  .sheet(isPresented: $isShowingSheet) {
                      SheetView()
                  }
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
