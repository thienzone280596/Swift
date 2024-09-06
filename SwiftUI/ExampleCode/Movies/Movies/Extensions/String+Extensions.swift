//
//  Extension+String.swift
//  Movies
//
//  Created by ThienTran on 2/9/24.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        // Check if the string is empty or contains only whitespace and new line characters
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
