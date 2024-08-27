//
//  CoreDataProvider.swift
//  BudgetApp
//
//  Created by ThienTran on 21/8/24.
//

import Foundation
import CoreData


class CoreDataProvider {
  // TODO: - step 1 create persistent store and init
  let persistentContainer: NSPersistentContainer

  // TODO: -step 2 create context
  var context: NSManagedObjectContext {
    persistentContainer.viewContext
  }

  static var preview:CoreDataProvider = {
    let provider = CoreDataProvider(inMemory: true)
    let context = provider.context
    let entertaiment = Budget(context: context)
    entertaiment.title = "Entertaiment"
    entertaiment.limit = 500
    entertaiment.dateCreated = Date()

    let groceries = Budget(context: context)
    groceries.title = "Groceries"
    groceries.limit = 200
    groceries.dateCreated = Date()

    let milk = Expense(context: context)
    milk.title = "Milk"
    milk.amount = 5.45
    milk.dateCreated = Date()

    let cookie = Expense(context: context)
    cookie.title = "Cookie"
    cookie.amount = 8.45
    cookie.dateCreated = Date()

    groceries.addToExpenses(cookie)
    groceries.addToExpenses(milk)
    //food expenses
    let foodItems = ["Burger", "Fries", "Cookies", "Noodles", "Popcorn", "Tacos", "Sushi", "Pizza", "Frozen Yogurt"]
    for foodItem in foodItems {
      let expense = Expense(context: context)
      expense.title = foodItem
      expense.amount = Double.random(in: 8...100)
      expense.dateCreated = Date()
      expense.budget = groceries

    }

    //insert Tags
    let commonTags = ["Food", "Dining", "Travel", "Entertainment", "Shopping", "Transportation", "Utilities", "Groceries", "Health", "Education"]
    for commonTag in commonTags {
        let tag = Tag(context: context)
        tag.name = commonTag
        if let tagName = tag.name, ["Food", "Groceries"].contains(tagName) {
            cookie.addToTags(tag)
        }

        if let tagName = tag.name, ["Health"].contains(tagName) {
            milk.addToTags(tag)
        }
    }

    do {
      try context.save()
    } catch {
      print(error)
    }
    return provider
  }()

  init(inMemory:Bool = false) {
    persistentContainer = NSPersistentContainer(name: "BudgetAppModel")
    if inMemory {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }

    persistentContainer.loadPersistentStores { _, error in
      if let error {
        fatalError("Core Data store failed to initialize \(error)")
      }
    }

  }

}
