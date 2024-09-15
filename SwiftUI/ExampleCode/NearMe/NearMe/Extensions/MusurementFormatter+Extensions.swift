//
//  MusurementFormatter+Extensions.swift
//  NearMe
//
//  Created by ThienTran on 15/9/24.
//

import Foundation

extension MeasurementFormatter {
  static var distance:MeasurementFormatter {
    let formatter = MeasurementFormatter()
    formatter.unitStyle = .medium
    formatter.unitOptions = .naturalScale
    formatter.locale = Locale.current
    return formatter
  }
}