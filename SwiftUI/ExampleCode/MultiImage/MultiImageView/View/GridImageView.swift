//
//  GridImageView.swift
//  MultiImageView
//
//  Created by ThienTran on 24/10/24.
//

import SwiftUI

struct GridImageView: View {
  var index:Int
  @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
      Button {
        withAnimation(.easeInOut) {
          //for base tab view automic scrolling
          homeData.selectedImageID = homeData.allImages[index]
          homeData.showImageViewer.toggle()

        }
      } label: {
        ZStack {
          if index <= 3 {
            Image(homeData.allImages[index])
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: getwidth(index: index), height: 120, alignment: .center)
              .cornerRadius(12)
          }
          if homeData.allImages.count > 4 && index == 3 {
            RoundedRectangle(cornerRadius: 12)
              .fill(Color.black.opacity(0.3))
            let reamainingImage = homeData.allImages.count - 4
            Text("+ \(reamainingImage)")
              .font(.title)
              .fontWeight(.heavy)
              .foregroundStyle(.white)
          }
        }
      }
    }

  func getwidth(index:Int) -> CGFloat {

    let  width = getRect().width - 100
    if homeData.allImages.count % 2 == 0 {
      return width / 2
    } else {
      if index == homeData.allImages.count  - 1 {
        return width
      } else {
        return width / 2
      }
    }
  }
}

#Preview {
  HomeView()
}

extension View {
  func getRect() -> CGRect {
    return UIScreen.main.bounds
  }
}
