//
//  CircleImage.swift
//  BeginSwiftUI
//
//  Created by ThienTran on 17/7/24.
//

import SwiftUI

struct CircleImage: View {
  var image: Image


  var body: some View {
    image
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

#Preview {
  CircleImage(image: Image("turtlerock"))
}
