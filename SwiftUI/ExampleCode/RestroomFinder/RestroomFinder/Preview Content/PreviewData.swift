//
//  PreviewData.swift
//  RestroomFinder
//
//  Created by ThienTran on 16/9/24.
//

import Foundation


struct PreviewData {

    static func load<T: Decodable>(resourceName: String) -> T {

        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource \(resourceName) does not exists.")
        }

        let data = try! Data(contentsOf: URL(filePath: path))
        return try! JSONDecoder().decode(T.self, from: data)
    }

}
