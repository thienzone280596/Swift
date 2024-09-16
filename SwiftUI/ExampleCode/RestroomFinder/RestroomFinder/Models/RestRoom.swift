//
//  RestRoom.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation
import CoreLocation
import MapKit
import Contacts

struct Restroom:Decodable, Identifiable, Equatable {
  let id: Int
  let name: String
  let street:String
  let city: String
  let state: String
  let accessible: Bool
  let unisex:Bool
  let changingTable:Bool
  let comment:String?
  let latitude:Double
  let longitude: Double

  var adress:String {
     "\(street), \(city) \(state)"
  }

  var coordinate:CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }

  enum CodingKeys: String, CodingKey, Decodable {
    case id
    case name
    case street
    case city
    case state
    case accessible
    case unisex
    case comment
    case latitude
    case longitude
    case changingTable = "changing_table"

      }
}

extension Restroom {
  var mapItem:MKMapItem {
    var addressDictionary: [String:Any] = [
      CNPostalAddressStreetKey: self.street,
      CNPostalAddressCityKey: self.city,
      CNPostalAddressStateKey: self.state
    ]
    let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = name
    return mapItem
  }
}
