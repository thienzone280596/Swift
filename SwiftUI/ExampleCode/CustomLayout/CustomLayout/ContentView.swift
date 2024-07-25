//
//  ContentView.swift
//  CustomLayout
//
//  Created by ThienTran on 20/7/24.
//

import SwiftUI

struct ExampleView:View {
  let color:Color
  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(color)
      .frame(width: 100, height: 100)
      .rotationEffect(.degrees(.random(in: -20...20)))
  }
}

struct ContentView: View {
  let layouts = [AnyLayout(VStackLayout()), AnyLayout(HStackLayout()), AnyLayout(ZStackLayout())]
  @State private var currentLayout = 0
  var layout:AnyLayout {
    layouts[currentLayout]
  }
    var body: some View {
      Spacer()
        layout {
          ExampleView(color: .red)
          ExampleView(color: .green)
          ExampleView(color: .blue)
          ExampleView(color: .orange)
        }
      Spacer()
      Button("Change Layout") {
        withAnimation {
          currentLayout += 1
          if currentLayout == layouts.count {
            currentLayout = 0
          }
        }
      }
      .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
