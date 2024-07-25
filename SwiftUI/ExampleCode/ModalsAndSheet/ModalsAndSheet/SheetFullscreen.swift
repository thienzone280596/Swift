//
//  SheetFullscreen.swift
//  ModalsAndSheet
//
//  Created by ThienTran on 25/7/24.
//

import SwiftUI

struct SheetFullscreen: View {
  @State private var isShowingFullScreenCover = false
  
    var body: some View {
      Button("Show Full Screen Cover") {
                 isShowingFullScreenCover.toggle()
             }
             .fullScreenCover(isPresented: $isShowingFullScreenCover) {
                 FullScreenCoverView()
             }
    }
}

struct FullScreenCoverView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a full screen cover!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}

#Preview {
    SheetFullscreen()
}
