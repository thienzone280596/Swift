//
//  BudgetListScreen.swift
//  SpendSmartUITests
//
//  Created by ThienTran on 10/9/24.
//

import Foundation
import XCTest


struct BudgetListScreen {
  let app: XCUIApplication
  private struct Elements {
    static let addBudgetCategoryButton = "AddBudgetCategoryButton"
    static let budgetCategoryList = "budgetCategoryList"


  }

  lazy var addBudgetcategoryButton:XCUIElement = {
    app.buttons[Elements.addBudgetCategoryButton]
  }()
  

  lazy var budgetCategoryList:XCUIElement = {
    app.buttons[Elements.budgetCategoryList]
  }()


}
