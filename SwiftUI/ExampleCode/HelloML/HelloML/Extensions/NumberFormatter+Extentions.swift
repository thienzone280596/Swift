//
//  NumberFormatter+Extentions.swift
//  HelloML
//
//  Created by ThienTran on 18/9/24.
//

import Foundation


extension NumberFormatter {
  static var percentage:NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.maximumFractionDigits = 2
    return formatter
  }
}
