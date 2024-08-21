//
//  String+Extensions.swift
//  Todo-CoreData
//
//  Created by ThienTran on 19/8/24.
//

import Foundation

extension String {
  var isEmptyOrWhitespace: Bool {
    return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}
