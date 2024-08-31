//
//  MigrationPolicy_v1_to_V2.swift
//  BudgetApp
//
//  Created by ThienTran on 29/8/24.
//

import Foundation
import CoreData

class MigrationPolicy_V1_to_V2:NSEntityMigrationPolicy {
  override func begin(_ mapping: NSEntityMapping, with manager: NSMigrationManager) throws {
    var titles:[String] = []
    var index:Int = 1

    let context = manager.sourceContext
    let expenseRequest = Expense.fetchRequest()

    let results:[NSManagedObject] = try context.fetch(expenseRequest)
    for result in results {
      guard let title = result.value(forKey: "title") as? String else {continue}
      if !titles.contains(title) {
        titles.append(title)
      } else {
        //delete the duplicate
        //context.delete(<#T##object: NSManagedObject##NSManagedObject#>)

        //it is a duplicate title
        let uniqueTitle = title + "\(index)"
        index += 1
        result .setValue(uniqueTitle, forKey: "title")

      }
    }
  }


}
