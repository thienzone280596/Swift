//
//  ContentView.swift
//  HelloML
//
//  Created by ThienTran on 17/9/24.
//

import SwiftUI

struct ContentView: View {
  let images = ["1", "2", "3", "4"]
  @State private var currentIndex:Int = 0
    var body: some View {
        VStack {
            Image(images[currentIndex])
              .resizable()
              .frame(width: 300, height: 300)
              .aspectRatio(contentMode: .fit)
          HStack {
            Button {
              currentIndex -= 1
            } label: {
              Text("Previous")
            }
            .buttonStyle(.bordered)
            .disabled(currentIndex == 0)

            Button {
              currentIndex += 1
            } label: {
              Text("Next")
            }
            .buttonStyle(.bordered)
            .disabled(currentIndex == images.count - 1)
          }
          Button {

          } label: {
            Text("Predict")
          }
          .buttonStyle(.borderedProminent)

          List(1...10, id: \.self) {
            index in
            Text("Prediction \(index)")
          }


        }
        .padding()
    }
}

#Preview {
    ContentView()
}
