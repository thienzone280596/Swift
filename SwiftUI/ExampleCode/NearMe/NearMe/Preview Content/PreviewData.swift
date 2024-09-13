//
//  PreviewData.swift
//  NearMe
//
//  Created by ThienTran on 13/9/24.
//

import Foundation
import MapKit
import Contacts


struct PreviewData {
  static var apple: MKMapItem {
    let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    let addressDictionary:[String:Any] = [
      CNPostalAddressStreetKey: "1 Infinite Loop",
      CNPostalAddressCityKey: "Cupertino",
      CNPostalAddressStateKey: "CA",
      CNPostalAddressPostalCodeKey: "95014",
      CNPostalAddressCountryKey: "United State"
    ]
    let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
    let mapItem = MKMapItem(placemark: placeMark)
    mapItem.name  = "Apple Inc."
    return mapItem
  }
}
