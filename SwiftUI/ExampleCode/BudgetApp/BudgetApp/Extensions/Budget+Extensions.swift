//
//  Budget+extensions.swift
//  BudgetApp
//
//  Created by ThienTran on 22/8/24.
//

import Foundation
import CoreData

extension Budget {
  static func exists(context:NSManagedObjectContext, title:String) -> Bool {
    let request = Budget.fetchRequest()
    request.predicate = NSPredicate(format: "title == %@", title)
    do {
      let result = try context.fetch(request)
      return !result.isEmpty
    } catch {
      return false
    }
  }
}
