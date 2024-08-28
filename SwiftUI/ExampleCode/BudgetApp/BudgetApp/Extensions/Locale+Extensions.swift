//
//  Locale+Extensions.swift
//  BudgetApp
//
//  Created by ThienTran on 26/8/24.
//

import Foundation

extension Locale {

    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }

}

