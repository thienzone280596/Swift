//
//  ContentView.swift
//  PopupImage
//
//  Created by ThienTran on 26/10/24.
//

import SwiftUI
import Photos


struct ContentView: View {
  @State private var showModel: Bool = false

  var body: some View {
    ZStack {
      Image("Background")
        .ignoresSafeArea(.all)
      Button {
        showModel = true
      } label: {
        Text("Click Me")
          .font(.system(size: 40, weight: .heavy))
          .padding(.vertical, 20)
          .padding(.horizontal, 20)
          .foregroundStyle(.white)
      }
      .background(.red)
      .offset(y: -100)
      ModelView(isShowing: $showModel)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onTapGesture {
      showModel = false
    }

  }
}

#Preview {
    ContentView()
}


struct CustomPicker:View {
  @Binding var selected:[UIImage]
  @Binding var data:[Images]
  @State var grid:[Int] = []
  var body: some View {
    GeometryReader { _ in
      VStack(alignment: .center) {

        Spacer()
      }
      .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
      .background(.white)
      .cornerRadius(12)
      .padding(.horizontal)
    }
    .background(Color.black.opacity(0.01).edgesIgnoringSafeArea(.all))
    .onAppear {
      PHPhotoLibrary.requestAuthorization { (status) in
        if status == .authorized {
          self.getAllImages()
        } else {
          print("not authorized")
        }
      }
    }
  }

  func getAllImages() {
    let req = PHAsset.fetchAssets(with: .image, options: .none)
    DispatchQueue.global(qos: .background).async {
      req.enumerateObjects { asset, _, _ in
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        PHCachingImageManager.default().requestImage(for: asset, targetSize: .init(), contentMode: .default, options: option) { image, _ in
          let data1 = Images(image: image!, selected: false)
          self.data.append(data1)
        }
      }
      if req.count == data.count {
        getGrid()
      }
    }
  }

  func getGrid() {
    for i in stride(from: 0, to: self.data.count, by: 3)
    {
      self.grid.append(i)
    }
  }
}

struct Images {
  var image:UIImage
  var selected:Bool
}
