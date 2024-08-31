//
//  Expense+Extensions.swift
//  BudgetApp
//
//  Created by ThienTran on 28/8/24.
//

import Foundation
import CoreData


extension Expense {
  var total:Double {
    amount * Double(quantity)
  }
}
