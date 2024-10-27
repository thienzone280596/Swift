//
//  HomeViewModel.swift
//  MultiImageView
//
//  Created by ThienTran on 24/10/24.
//

import SwiftUI

struct HomeView: View {
  @StateObject var homeData = HomeViewModel()

  init() {
    UIScrollView.appearance().bounces = false
  }

    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          Text("I Justed new photo")
          //custom gird of Item
          let collumns = Array(repeating: GridItem(.flexible(), spacing: 15) ,count: 2)
          LazyHGrid(rows: collumns,alignment: .center, spacing: 10) {
            ForEach(homeData.allImages.indices, id: \.self) { index in
              GridImageView(index: index)
            }
          }
          .padding(.top)
        }
      }
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay {
        ZStack {
          if homeData.showImageViewer {
            Color.black
              .opacity(homeData.bgObacity)
              .ignoresSafeArea()
            ImageView()
          }
        }
      }
      .environmentObject(homeData)
    }
}

#Preview {
  HomeView()
}
