//
//  LocationManager.swift
//  NearMe
//
//  Created by ThienTran on 12/9/24.
//

import Foundation
import MapKit
import Observation

@Observable
class LocationManager:NSObject, CLLocationManagerDelegate {
  let manage = CLLocationManager()
  let shared = LocationManager()
  var region:MKCoordinateRegion = MKCoordinateRegion()

  override init() {
    super.init()
    self.manage.delegate = self
  }
}

extension LocationManager {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locations.last.map{
      region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
  }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus {
    case .notDetermined:
      return manager.requestWhenInUseAuthorization()
    case .restricted:
      print("restricted")
    case .denied:
      print("denied")
    case .authorizedAlways,.authorizedWhenInUse:
      return manager.requestLocation()
    @unknown default:
      break
    }
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
    print(error)
  }
}
