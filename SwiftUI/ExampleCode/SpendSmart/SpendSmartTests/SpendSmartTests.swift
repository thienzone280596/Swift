//
//  SpendSmartTests.swift
//  SpendSmartTests
//
//  Created by Mohammad Azam on 10/3/23.
//

import XCTest
import SwiftData

final class SpendSmartTests: XCTestCase {

    private var budgetCategory: BudgetCategory!
    private var context: ModelContext!
    
    @MainActor
    override func setUp() {
        
        context = mockContainer.mainContext
        self.budgetCategory = BudgetCategory(title: "Groceries", amount: 300)
        try! self.budgetCategory.save(context: context)

    }
    
  @MainActor
    func testCaculateTransactionsForBudget() {
      let transactions = [Transaction(title: "Milk", amount: 10, quantity: 1), Transaction(title: "Break", amount: 2.5, quantity: 2), Transaction(title: "Eggs", amount: 4.75, quantity: 4)]
      for transaction in transactions {
        budgetCategory.addTransaction(context: context, transaction: transaction)
      }
      XCTAssertEqual(34, budgetCategory.total)
    }

  @MainActor
  func testCaculateRemaining() {
    let transactions = [Transaction(title: "Milk", amount: 10, quantity: 1), Transaction(title: "Break", amount: 2.5, quantity: 2), Transaction(title: "Eggs", amount: 4.75, quantity: 4)]
    for transaction in transactions {
      budgetCategory.addTransaction(context: context, transaction: transaction)
    }
    XCTAssertEqual(266, budgetCategory.remaining)
  }

    func testThrowTitleExceptionWhenInsertingDuplicateBudgetCategory() throws {
        let newBudgetCategory = BudgetCategory(title: "Groceries", amount: 300)

        XCTAssertThrowsError(try newBudgetCategory.save(context: context), "No exception was thrown") { error in
            let thrownError = error as? BudgetCategoryError
            XCTAssertNotNil(thrownError)
            XCTAssertEqual(BudgetCategoryError.titleAlreadyExist, thrownError)
        }
        
    }
    
}
