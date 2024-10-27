//
//  ImageView.swift
//  MultiImageView
//
//  Created by ThienTran on 24/10/24.
//

import SwiftUI

struct ImageView: View {
  @EnvironmentObject var homeData:HomeViewModel
  @GestureState var draggingOffset: CGSize = .zero
    var body: some View {
      ZStack {
        ScrollView(.init()) {
          TabView(selection: $homeData.selectedImageID) {
            ForEach(homeData.allImages, id: \.self) {
              image in
              Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tag(image)
                .scaleEffect(homeData.selectedImageID == image ? (homeData.imageScale > 1 ? homeData.imageScale: 1): 1)
              //moving only Image
              //for smooth animation
                .offset(y:homeData.imageViewrOffset.height)
                .gesture(
                  MagnificationGesture().onChanged({ value in
                    homeData.imageScale = value
                  }).onEnded({ (_) in
                    withAnimation(.spring()) {
                      homeData.imageScale = 1
                    }
                  })
                  ///douuble to zoom
                    .simultaneously(with: TapGesture(count: 2).onEnded({
                      withAnimation() {
                        homeData.imageScale = homeData.imageScale > 1 ? 1 : 4
                      }
                    }))
                )
            }
          }
          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
          .overlay (
            Button(action: {
              withAnimation(.default) {
                homeData.showImageViewer.toggle()
              }
            }, label: {
              Image(systemName: "xmark")
                .foregroundStyle(.white)
                .padding()
                .background(.white.opacity(0.35))
                .clipShape(Circle())
            })
            .padding(10)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .opacity(homeData.bgObacity),
            alignment: .topTrailing
          )
        }
        .ignoresSafeArea()
      }
      .gesture(DragGesture().updating($draggingOffset, body: { value, outValue, _ in
        outValue = value.translation
        homeData.onChange(value: draggingOffset)
      }).onEnded(homeData.onEnd(value:)))
      .transition(.move(edge: .bottom))
    }
}

#Preview {
  HomeView()
}
