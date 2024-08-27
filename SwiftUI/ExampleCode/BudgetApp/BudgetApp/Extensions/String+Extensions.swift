//
//  String+Extensions.swift
//  BudgetApp
//
//  Created by ThienTran on 22/8/24.
//

import Foundation


extension String {

    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

}
