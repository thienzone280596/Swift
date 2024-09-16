//
//  HTTPClient.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation


protocol HTTPClient {
  func fetchRestrooms(url:URL) async throws -> [Restroom]
}
