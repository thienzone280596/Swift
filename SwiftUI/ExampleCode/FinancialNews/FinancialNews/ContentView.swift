//
//  ContentView.swift
//  FinancialNews
//
//  Created by ThienTran on 19/9/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
  @State private var text:String = ""
  @State private var result:String = ""
  let model = try! FinancialNewsSentimentAnalysis(configuration: MLModelConfiguration())

  private func getSentimentBackgroundColor(_ sentiment:String) -> Color{
    switch sentiment {
    case "positive":
      return .green
    case "negative":
      return .red
    default:
      return .gray
    }
  }

    var body: some View {
        VStack {
          Text(result)
            .frame(height: 64)
            .foregroundStyle(.white)
            .font(.largeTitle)
          Spacer()
          TextField("Text", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding([.bottom], 10)
          Button {
            do {
              result = try model.prediction(text: text).label
            } catch {
              print(error)
            }
          } label: {
            Text("Calculate")
          }
          .buttonStyle(.borderedProminent)

          Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(getSentimentBackgroundColor(result))
    }
}

#Preview {
    ContentView()
}
