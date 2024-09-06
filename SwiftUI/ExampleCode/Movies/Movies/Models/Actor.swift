//
//  Actor.swift
//  Movies
//
//  Created by ThienTran on 4/9/24.
//

import Foundation
import SwiftData

@Model
final class Actor {
  var name:String
  var movies:[Movie] = []

  init(name: String) {
    self.name = name
  }
}
