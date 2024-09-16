//
//  HTTPClientKey.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation
import SwiftUI


struct HTTPClientKey:EnvironmentKey {
  static var defaultValue:HTTPClient = RestroomClient()

}

extension EnvironmentValues {
  var httpClient:HTTPClient {
    get { self[HTTPClientKey.self]}
    set { self[HTTPClientKey.self] = newValue}
  }
}
