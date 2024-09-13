//
//  LocationManager.swift
//  NearMe
//
//  Created by ThienTran on 12/9/24.
//

import Foundation
import MapKit
import Observation

enum LocationError: LocalizedError {
  case authorizationDenied
  case authorizationRestricted
  case unknownLocation
  case acessDenied
  case network
  case operationFailed

  var errorLocation:String? {
    switch self {
    case .authorizationDenied:
      return NSLocalizedString("Location access denied.", comment: "")
    case .authorizationRestricted:
      return NSLocalizedString("Location access restricted.", comment: "")
    case .unknownLocation:
      return NSLocalizedString("Unknown Location.", comment: "")
    case .acessDenied:
      return NSLocalizedString("Access denied.", comment: "")
    case .network:
      return NSLocalizedString("Network Failed.", comment: "")
    case .operationFailed:
      return NSLocalizedString("Operation Failed.", comment: "")
    }
  }
}

@Observable
class LocationManager:NSObject, CLLocationManagerDelegate {
  let manage = CLLocationManager()
  let shared = LocationManager()
  var region:MKCoordinateRegion = MKCoordinateRegion()
  var error:LocationError? = nil

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
      error = .authorizationRestricted
    case .denied:
      error = .authorizationDenied
    case .authorizedAlways,.authorizedWhenInUse:
      return manager.requestLocation()
    @unknown default:
      break
    }
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
    if let clError = error as? CLError {
      switch clError.code {
      case .locationUnknown:
        self.error = .unknownLocation
      case .denied:
        self.error = .authorizationDenied
      case .network:
        self.error = .network
      @unknown default:
        break 
      }
    }
  }
}
