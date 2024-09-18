//
//  ContentView.swift
//  HelloML
//
//  Created by ThienTran on 17/9/24.
//

import SwiftUI
import CoreML


struct ProbabilitiListView: View {
  let probs:[Dictionary<String, Double>.Element]

  var body: some View {
    List(probs, id: \.key) { (key, value) in
      HStack {
        Text(key)
        Spacer()
        Text(NSNumber(value: value), formatter: NumberFormatter.percentage)
      }
    }
  }
}

struct ContentView: View {
  let images = ["1", "2", "3", "4"]

  let model = try! MobileNetV2(configuration: MLModelConfiguration())
  @State private var probs: [String:Double] = [:]
  private var sortedProb:[Dictionary<String, Double>.Element] {
    let probsArray = Array(probs)
   return probsArray.sorted{ lhs, rhs in
      lhs.value > rhs.value
    }
  }

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
              print(prediction.classLabelProbs)
              probs = prediction.classLabelProbs
            } catch {
              print(error.localizedDescription)
            }
          } label: {
            Text("Predict")
          }
          .buttonStyle(.borderedProminent)
          ProbabilitiListView(probs: Array(sortedProb))

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
