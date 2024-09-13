//
//  PlaceView.swift
//  NearMe
//
//  Created by ThienTran on 13/9/24.
//

import SwiftUI
import MapKit

struct PlaceView: View {

  let mapItem:MKMapItem
  private var address:String {
    let placeMark = mapItem.placemark
    let address = "\(placeMark.thoroughfare ?? "") \(placeMark.subThoroughfare ?? ""), \(placeMark.locality ?? ""), \(placeMark.administrativeArea ?? "") \(placeMark.postalCode ?? ""), \(placeMark.country ?? "")"
    return address
  }

    var body: some View {
      VStack(alignment: .leading) {
        Text(mapItem.name ?? "")
          .font(.title3)
        Text(address)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
}

#Preview {
  PlaceView(mapItem: PreviewData.apple)
}
