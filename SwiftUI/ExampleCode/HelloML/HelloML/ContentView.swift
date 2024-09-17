//
//  ContentView.swift
//  HelloML
//
//  Created by ThienTran on 17/9/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
  let images = ["1", "2", "3", "4"]

  let model = try! MobileNetV2(configuration: MLModelConfiguration())

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
            guard let uiImage = UIImage(named:images[currentIndex]) else {return}
            //resize image
            let resizeImage = uiImage.resize(to: CGSize(width: 224, height: 224))
            guard let buffer = resizeImage?.toCVPixelBuffer() else {return}
            do {
              let prediction = try model.prediction(image: buffer)
              print(prediction.classLabel)
            } catch {
              print(error.localizedDescription)
            }


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
