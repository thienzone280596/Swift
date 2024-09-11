//
//  TodoItem.swift
//  TodoListSwiftData
//
//  Created by ThienTran on 11/9/24.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
  var title:String
  
  init(title: String) {
    self.title = title
  }

}
