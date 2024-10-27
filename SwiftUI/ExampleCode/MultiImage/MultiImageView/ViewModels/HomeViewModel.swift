//
//  HomeViewModel.swift
//  MultiImageView
//
//  Created by ThienTran on 24/10/24.
//

import SwiftUI


class HomeViewModel:ObservableObject {
  @Published var allImages: [String] = ["image1","image2","image3","image4","image5","image6","image7","image8", "image8"]
  @Published var showImageViewer:Bool = false
  @Published var selectedImageID:String = ""
  @Published var imageViewrOffset: CGSize = .zero
  //Bg Opacity
  @Published var bgObacity:Double = 1
  @Published var imageScale:CGFloat = 1
  func onChange(value:CGSize) {
    //update Offset
    imageViewrOffset = value
    //Calculate opacity
    let halHeight = UIScreen.main.bounds.height / 2
    let progress = imageViewrOffset.height / halHeight
    withAnimation(.default) {
      bgObacity = Double(1-progress < 0 ? -progress : progress)
    }
  }

  func onEnd(value:DragGesture.Value) {
    withAnimation(.easeInOut) {
      var translation = value.translation.height
      if translation < 0 {
        translation = -translation
      }
      if translation < 250 {
        imageViewrOffset = .zero
        bgObacity = 1
      } else {
        showImageViewer.toggle()
        imageViewrOffset = .zero
        bgObacity = 1
      }

    }
  }
}
