//
//  BudgetListScreen.swift
//  BudgetApp
//
//  Created by ThienTran on 22/8/24.
//

import SwiftUI

struct BudgetListScreen: View {
  @FetchRequest(sortDescriptors: []) private var budgets: FetchedResults<Budget>

  @State private var isPresented: Bool = false
    var body: some View {
      VStack {
        List(budgets) { budget in
          NavigationLink {
              BudgetDetailScreen(budget: budget)
          } label: {
              BudgetCellView(budget: budget)
          }
        }
      }
      .navigationTitle("Budget App")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isPresented = true
          } label: {
            Text("Add Budget")
          }
        }
      }
      .sheet(isPresented: $isPresented) {
       AddBudgetScreen()
      }

    }
}

#Preview {
  NavigationStack {
    BudgetListScreen()
  }
  .environment(\.managedObjectContext, CoreDataProvider.preview.context)
}
