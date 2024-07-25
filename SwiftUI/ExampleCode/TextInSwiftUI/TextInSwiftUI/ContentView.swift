//
//  ContentView.swift
//  TextInSwiftUI
//
//  Created by ThienTran on 19/7/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      // TODO: - text basic
       Text("Text Basic")
      // TODO: - modifier Text with "FONT"
                Text("Using Font Text")
                  .font(.title)
      // TODO: - Text Font weight
                Text("Text using Fontweight")
                  .fontWeight(.light)
      // TODO: -Font style
      Text("Text Font style")
        .font(.system(size: 24, weight: .semibold, design: .rounded))
       // TODO: - Text color
      Text("Text Color")
          .foregroundColor(.blue)
       // TODO: - Text Alignment
      Text("This is a long line of text that will wrap onto multiple lines. This is an example of multiline text alignment.")
          .multilineTextAlignment(.center)
          .frame(width: 200)  // Restrict width to demonstrate wrapping
       // TODO: - back ground and padding Text
      Text("Background and padding Text")
          .padding()
          .background(Color.yellow)
       // TODO: - Border Text
      Text("Border Text")
          .padding()
          .border(Color.red, width: 2)
       // TODO: - Shadow Text
      Text("Shadow Text")
          .shadow(color: .gray, radius: 2, x: 0, y: 2)
       // TODO: -Strikethrough and Underline"
      Text("Strikethrough and Underline")
          .strikethrough(true, color: .red)
          .underline(true, color: .blue)


    }
    .padding()
  }
}

#Preview {
  ContentView()
}
