//
//  Genre.swift
//  Movies
//
//  Created by ThienTran on 9/9/24.
//

import Foundation


enum Genre:Int, Codable, CaseIterable, Identifiable {
  case action = 1
  case horror
  case kids
  case fiction

  var id: Int {
    hashValue
  }
}

extension Genre {
  var title:String {
    switch self {
    case .action:
      return "Action"
    case .horror:
      return "Horror"
    case .kids:
      return "Kids"
    case .fiction:
      return "Fiction"
    }
  }
}
