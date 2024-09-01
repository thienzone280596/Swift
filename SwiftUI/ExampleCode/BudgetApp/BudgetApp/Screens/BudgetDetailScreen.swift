//
//  BudgetDetailScreen.swift
//  BudgetApp
//
//  Created by ThienTran on 24/8/24.
//

import SwiftUI
import CoreData

struct EditExpenseConfig:Identifiable {
  let id = UUID()
  let expenses: Expense
  let childContext:NSManagedObjectContext

  init?(expenseObjectID: NSManagedObjectID, context: NSManagedObjectContext) {
    self.childContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    self.childContext.parent = context
    guard let existingExpense = self.childContext.object(with: expenseObjectID) as? Expense else {
      return nil
    }
    self.expenses = existingExpense
  }
}

struct BudgetDetailScreen: View {
  let budget:Budget
  @State private var title:String = ""
  @State private var amount:Double?
  @State private var selectedTags:Set<Tag> = []
  @State private var quantity:Int?
  @State private var expenseToEdit:Expense?
  @State private var editExpenseConfig:EditExpenseConfig?
  @Environment(\.managedObjectContext) private var context
  @FetchRequest(sortDescriptors: []) private var expenses: FetchedResults<Expense>

  private var isFormValid: Bool {
    !title.isEmptyOrWhitespace && amount != nil && Double(amount!) > 0 && !selectedTags.isEmpty && quantity != nil && Int(quantity!) > 0
  }

  private func addExpense() {
    let expense = Expense(context:context)
    expense.title = title
    expense.amount = amount ?? 0.0
    expense.quantity = Int16(quantity ?? 0)
    expense.dateCreated = Date()
    expense.tags = NSSet(array: Array(selectedTags))
    budget.addToExpenses(expense)
    do {
      try context.save()
      title = ""
      amount = nil
      quantity = nil
      selectedTags = []
    } catch {
      context.rollback()
      print(error)
    }
  }
  
  private func deleteExpense(_ indexSet:IndexSet) {
    indexSet.forEach {
      index in
      let expense = expenses[index]
      context.delete(expense)
    }

    do {
      try context.save()
    } catch {
      print(error.localizedDescription)
    }
  }

  init(budget: Budget) {
    self.budget = budget
    _expenses = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "budget == %@", budget))

  }

  var body: some View {
    VStack {
      Text(budget.limit, format: .currency(code: Locale.currencyCode))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

    Form{

      Section("New Expanse") {
        TextField("title", text: $title)
        TextField("Amount", value: $amount, format: .number)
          .keyboardType(.numberPad)
        TextField("Quantity", value: $quantity, format: .number)
        TagView(selectedTags: $selectedTags)
        Button {
          addExpense()
        } label: {
          Text("Save")
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!isFormValid)
      }
      Section("Expense") {
        VStack(alignment:.leading) {
          HStack {
              Spacer()
              Text("Spent")
              Text(budget.spent, format: .currency(code: Locale.currencyCode))
              Spacer()
          }
          HStack {
            Spacer()
            Text("Remaining")
            Text(budget.remaining, format: .currency(code: Locale.currencyCode))
              .foregroundStyle(budget.remaining < 0 ? .red: .green)
            Spacer()
          }
        }

        ForEach(expenses) {
          expense in
          ExpenseCellView(expense: expense)
            .onLongPressGesture {
              //expenseToEdit = expense
              editExpenseConfig = EditExpenseConfig(expenseObjectID: expense.objectID, context: context)

            }
        }
        .onDelete(perform: { indexSet in
          deleteExpense(indexSet)
        })
      }
    }.navigationTitle(budget.title ?? "")
      .sheet(item: $editExpenseConfig) { editExpenseConfig in
        NavigationStack {
          EditExenseScreen(expense: editExpenseConfig.expenses) {
            do {
              try context.save()
              self.editExpenseConfig = nil
            } catch {
              print(error)
            }

          }
            .environment(\.managedObjectContext, editExpenseConfig.childContext)
        }
      }
  }
}

struct BudgetDetailScreenContainer: View {
  @FetchRequest(sortDescriptors: []) private var budgets:FetchedResults<Budget>
  var body: some View {
    BudgetDetailScreen(budget:budgets.first(where: {$0.title == "Groceries"})!)
  }
}

#Preview {
  NavigationStack {
    BudgetDetailScreenContainer()
      .environment(\.managedObjectContext,CoreDataProvider.preview.context)
  }
}

