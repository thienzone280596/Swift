//
//  BudgetDetailScreen.swift
//  BudgetApp
//
//  Created by ThienTran on 24/8/24.
//

import SwiftUI

struct BudgetDetailScreen: View {
  let budget:Budget
  @State private var title:String = ""
  @State private var amount:Double?
  @State private var selectedTags:Set<Tag> = []
  @Environment(\.managedObjectContext) private var context
  @FetchRequest(sortDescriptors: []) private var expenses: FetchedResults<Expense>

  private var isFormValid: Bool {
    !title.isEmptyOrWhitespace && amount != nil && Double(amount!) > 0 && !selectedTags.isEmpty
  }

  private func addExpense() {
    let expense = Expense(context:context)
    expense.title = title
    expense.amount = amount ?? 0.0
    expense.dateCreated = Date()
    expense.tags = NSSet(array: Array(selectedTags))
    budget.addToExpenses(expense)
    do {
      try context.save()
      title = ""
      amount = nil
      selectedTags = []
    } catch {
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
        }
        .onDelete(perform: { indexSet in
          deleteExpense(indexSet)
        })
      }
    }.navigationTitle(budget.title ?? "")
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

