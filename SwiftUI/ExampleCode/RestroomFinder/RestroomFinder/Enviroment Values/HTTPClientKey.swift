//
//  HTTPClientKey.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation
import SwiftUI


struct HTTPClientKey:EnvironmentKey {
  static var defaultValue = RestroomClient()

}

extension EnvironmentValues {
  var httpClient:RestroomClient {
    get { self[HTTPClientKey.self]}
    set { self[HTTPClientKey.self] = newValue}
  }
}
