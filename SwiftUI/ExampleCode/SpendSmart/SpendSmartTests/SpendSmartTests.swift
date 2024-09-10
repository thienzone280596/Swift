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
        self.budgetCategory = BudgetCategory(title: "Travel", amount: 300)
        try! self.budgetCategory.save(context: context)
    }
    
    func testThrowTitleExceptionWhenInsertingDuplicateBudgetCategory() throws {
        
        let newBudgetCategory = BudgetCategory(title: "Travel", amount: 300)
        
        XCTAssertThrowsError(try newBudgetCategory.save(context: context), "No exception was thrown") { error in
            let thrownError = error as? BudgetCategoryError
            XCTAssertNotNil(thrownError)
            XCTAssertEqual(BudgetCategoryError.titleAlreadyExist, thrownError)
        }
        
    }
    
}