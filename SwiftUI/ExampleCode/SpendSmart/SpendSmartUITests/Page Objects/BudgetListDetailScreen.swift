//
//  BudgetDetailScreen.swift
//  SpendSmartUITests
//
//  Created by ThienTran on 10/9/24.
//

import Foundation
import XCTest

struct BudgetListDetailScreen {
  let app: XCUIApplication
  private struct Elements {
    static let transactionTitleTextField = "transactionTitleTextField"
    static let transactionAmountTextField = "transactionAmountTextField"
    static let transactionQuantityTextField = "transactionQuantityTextField"
    static let addTransactionButton = "addTransactionButton"
    static let spentText = "spentText"
    static let remainingText = "remainingText"
    static let transactionList = "transactionList"
  }

  lazy var transactionTitleTextField:XCUIElement = {
    app.textFields[Elements.transactionTitleTextField]
  }()


  lazy var transactionAmountTextField:XCUIElement = {
    app.textFields[Elements.transactionAmountTextField]
  }()

  lazy var transactionQuantityTextField:XCUIElement = {
    app.textFields[Elements.transactionQuantityTextField]
  }()


  lazy var addTransactionButton:XCUIElement = {
    app.buttons[Elements.addTransactionButton]
  }()

  lazy var spentText:XCUIElement = {
    app.staticTexts[Elements.spentText]
  }()


  lazy var remainingText:XCUIElement = {
    app.staticTexts[Elements.remainingText]
  }()

  lazy var budgetCategoryList:XCUIElement = {
    app.buttons[Elements.transactionList]
  }()

}
