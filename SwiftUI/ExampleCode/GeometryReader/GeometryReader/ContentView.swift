//
//  ContentView.swift
//  GeometryReader
//
//  Created by ThienTran on 19/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       // TODO: - Geometr proxy
//      GeometryReader { geometry in
//               VStack {
//                   Text("Top Text")
//                       .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
//                       .background(Color.red)
//                   Text("Bottom Text")
//                       .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
//                       .background(Color.blue)
//               }
//           }
       // TODO: - Responsive design
//      GeometryReader { geometry in
//                 VStack {
//                     Text("Centered Text")
//                         .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.1)
//                         .background(Color.green)
//                         .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
//                 }
//             }
 // TODO: - geometryReader
//      GeometryReader { geometry in
//                 VStack {
//                     Text("Top Text")
//                         .padding(.top, geometry.safeAreaInsets.top)
//                         .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
//                         .background(Color.red)
//                     Text("Bottom Text")
//                         .padding(.bottom, geometry.safeAreaInsets.bottom)
//                         .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
//                         .background(Color.blue)
//                 }
//             }
//             .edgesIgnoringSafeArea(.all)
 // TODO: - Geometry Nested
      GeometryReader { outerGeometry in
                 VStack {
                     Text("Outer Width: \(outerGeometry.size.width)")
                     GeometryReader { innerGeometry in
                         Text("Inner Width: \(innerGeometry.size.width)")
                             .frame(width: innerGeometry.size.width / 2, height: innerGeometry.size.height / 2)
                             .background(Color.green)
                     }
                     .background(Color.yellow)
                 }
             }
             .background(Color.gray)
    }
}

#Preview {
    ContentView()
}
