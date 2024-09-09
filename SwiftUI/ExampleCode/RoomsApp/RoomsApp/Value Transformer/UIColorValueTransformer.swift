//
//  UIColorValueTransformer.swift
//  RoomsApp
//
//  Created by ThienTran on 9/9/24.
//

import Foundation
import UIKit


class UIColorValueTransformer:ValueTransformer {
  //return data
  override func transformedValue(_ value: Any?) -> Any? {
    guard let color = value as? UIColor else {return nil}
    do {
      let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
      return data
    } catch {
      return nil
    }
  }
  
  //return UIColor
  override func reverseTransformedValue(_ value: Any?) -> Any? {
    guard let data = value as? Data else { return nil }

    do {
        let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        return color
    } catch {
        return nil
    }
  }
}
