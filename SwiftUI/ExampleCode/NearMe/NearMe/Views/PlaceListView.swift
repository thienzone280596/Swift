//
//  PlaceListView.swift
//  NearMe
//
//  Created by ThienTran on 15/9/24.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    let mapItems:[MKMapItem]
    var body: some View {
      VStack {
        List(mapItems, id: \.self) { mapItem in
         PlaceView(mapItem: mapItem)
        }
      }
    }
}

#Preview {
  PlaceListView(mapItems: [PreviewData.apple])
}
