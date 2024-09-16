//
//  Constants.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation


struct Constants {
  struct Urls {
    static func restroomsByLocation(latutude:Double, longtitude:Double) -> URL {
      return URL(string: "https://www.refugerestrooms.org/api/v1/restrooms/by_location?lat=\(latutude)&lng=\(longtitude)")!
    }
  }
}
