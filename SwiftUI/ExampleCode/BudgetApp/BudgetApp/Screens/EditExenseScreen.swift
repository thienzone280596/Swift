//
//  EditExenseScreen.swift
//  BudgetApp
//
//  Created by ThienTran on 30/8/24.
//

import SwiftUI

struct EditExenseScreen: View {

  @ObservedObject var expense:Expense
 @Environment(\.managedObjectContext) private var context
  let onUpdate: () -> Void
//  @State private var title:String = ""
//  @State private var amount:Double?
//  @State private var expenseSelectedTags:Set<Tag> = []
//  @State private var quantity:Int?
  @Environment(\.dismiss) private var dismiss

  private func updateExpense() {
//    expense.title = title
//    expense.amount = amount ?? 0.0
//    expense.quantity = Int16(quantity ?? 0)
//    expense.dateCreated = Date()
//    expense.tags = NSSet(array: Array(expenseSelectedTags))

    do {
      try context.save()
//      dismiss()
      onUpdate()
    } catch {
      print(error)
    }

  }

    var body: some View {
      Form(content: {
        TextField("Title", text: Binding(get: {
          expense.title ?? ""
        }, set: { newValue in
          expense.title = newValue
        }))
        TextField("Amount", value: $expense.amount, format: .number)
        TextField("Quantity", value: $expense.quantity, format: .number)
        TagView(selectedTags: Binding(get: {
          Set(expense.tags?.compactMap{$0 as? Tag} ?? [])
        }, set: { newValue in
          expense.tags = NSSet(array: Array(newValue))
        }))
      })
      .onAppear {

      }
      .toolbar(content: {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            updateExpense()
          } label: {
            Text("Update")
          }

        }
      })
        .navigationTitle(expense.title ?? "")
    }
}

struct EditExenseContainerView: View {
  @FetchRequest(sortDescriptors: []) private var expenses:FetchedResults<Expense>
  var body: some View {
    NavigationStack {
      EditExenseScreen(expense: expenses[0], onUpdate: {})

    }
  }
}

#Preview {
  EditExenseContainerView()
    .environment(\.managedObjectContext, CoreDataProvider.preview.context)
}
