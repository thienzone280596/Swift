//
//  MockRestroomClient.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation


struct MockRestroomClient:HTTPClient {


  func fetchRestrooms(url: URL) async throws -> [Restroom] {

    return PreviewData.load(resourceName: "restrooms")
  }
  

}
