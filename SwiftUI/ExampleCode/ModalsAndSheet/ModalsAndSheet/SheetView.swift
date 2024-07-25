//
//  SheetView.swift
//  ModalsAndSheet
//
//  Created by ThienTran on 25/7/24.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
      @Environment(\.presentationMode) var presentationMode

      VStack {
                 Text("This is a sheet!")
                 Button("Dismiss") {
                   presentationMode.wrappedValue.dismiss()
                 }
                 .padding()
             }
    }
}

#Preview {
    SheetView()
}
