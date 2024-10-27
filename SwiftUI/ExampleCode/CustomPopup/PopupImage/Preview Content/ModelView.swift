//
//  ModelView.swift
//  PopupImage
//
//  Created by ThienTran on 27/10/24.
//

import SwiftUI

struct ModelView: View {
  @Binding var isShowing: Bool
  @State private var isDragging:Bool = false
  @State private var curHeight:CGFloat = 400
  let minHeught:CGFloat = 400
  let maxHeught:CGFloat = 700

    var body: some View {
      //if is showing is true
      ZStack(alignment: .bottom) {
      if isShowing {
          mainView
            .transition(.move(edge: .bottom))
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
      .ignoresSafeArea()
      .onTapGesture {
        isShowing = false
      }
    }

  // MARK: - Main View
  var mainView: some View {
    VStack {
      ZStack {
        Capsule()
          .frame(width: 40, height: 6)
          .padding(.top, 5)
      }
      .frame(height: 40)
      .frame(maxWidth: .infinity)
      .background(Color.white.opacity(0.00001))
      .gesture(dragGuesture)
      ZStack {
        VStack {
          Text("Hello, World!")
            .font(.system(size: 20, weight: .heavy))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)

        }
        .padding(.horizontal, 30)
      }
      .frame(maxHeight: .infinity)
    }
    .frame(height: curHeight)
    .frame(maxWidth: .infinity)
    .background(
      Color.white
    )
    .animation(isDragging ? nil: .easeInOut, value: 0.45)
  }

  @State private var prevDragTranslation = CGSize.zero
  var dragGuesture: some Gesture {
    DragGesture(minimumDistance: 0, coordinateSpace: .global)
      .onChanged { val in
        let dragAmount = val.translation.height - prevDragTranslation.height
        if !isDragging {
          isDragging = true
        }
        if curHeight > maxHeught || curHeight < minHeught {
          curHeight -= dragAmount / 6
        } else {
          curHeight -= dragAmount
        }
        prevDragTranslation = val.translation
      }.onEnded { val in
        prevDragTranslation = .zero
        isDragging = false
        if curHeight > maxHeught {
          curHeight = maxHeught
        } else if curHeight < maxHeught {
          curHeight = minHeught
        }
      }
  }
}

#Preview {
  ContentView()
}
