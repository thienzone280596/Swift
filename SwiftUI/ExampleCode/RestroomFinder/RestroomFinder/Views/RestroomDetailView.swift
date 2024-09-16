//
//  RestroomDetailView.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import SwiftUI

struct AmenitiesView:View {
  let restroom:Restroom

  var body: some View {
    HStack(spacing:12) {
      AmenityView(symbol: "♿️", isEnable: restroom.accessible)
      AmenityView(symbol: "🚻", isEnable: restroom.unisex)
      AmenityView(symbol: "🚼", isEnable: restroom.changingTable)
    }
  }
}

struct AmenityView:View {
  let symbol:String
  let isEnable:Bool

  var body: some View {
    if isEnable {
      Text(symbol)
    }
  }
}

struct RestroomDetailView: View {
  let restroom:Restroom

    var body: some View {
      VStack(alignment:.leading) {
        Text(restroom.name)
          .font(.title)
        Text(restroom.adress)
        if let comment = restroom.comment {
          Text(comment)
            .font(.caption)
        }
        AmenitiesView(restroom: restroom)
        ActionButtons(mapItem: restroom.mapItem)
      }
      .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
  let restrooms:[Restroom] = PreviewData.load(resourceName: "restrooms")
  return RestroomDetailView(restroom: restrooms[0])
}
