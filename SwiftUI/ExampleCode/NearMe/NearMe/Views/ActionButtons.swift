//
//  ActionButtons.swift
//  NearMe
//
//  Created by ThienTran on 15/9/24.
//

import SwiftUI
import MapKit

struct ActionButtons: View {
  let mapItem:MKMapItem
    var body: some View {
      HStack {
        Button {
          if let phone = mapItem.phoneNumber {
           let numericPhoneNumber =  phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            makeCall(phone: numericPhoneNumber)
          }
        } label: {
          HStack {
            Image(systemName: "phone.fill")
            Text("Call")
          }
        }
        .buttonStyle(.bordered)

        Button {
          MKMapItem.openMaps(with: [mapItem])
        } label: {
          HStack {
            Image(systemName: "car.circle.fill")
            Text("Take me there")
          }
        }
        .buttonStyle(.bordered)
        .tint(.green)
        
      }
    }
}

#Preview {
  ActionButtons(mapItem: PreviewData.apple)
}
