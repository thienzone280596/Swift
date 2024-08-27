//
//  FilterScreen.swift
//  BudgetApp
//
//  Created by ThienTran on 26/8/24.
//

import SwiftUI

struct FilterScreen: View {
  @Environment(\.managedObjectContext) private var context
  @State private var selectedTags:Set<Tag> = []
  @State private var filteredExpenses:[Expense] = []
  @State private var showAll:Bool = false
  @State private var startPrice:Double?
  @State private var endPrice:Double?
  @State private var title:String = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  @FetchRequest(sortDescriptors: []) private var expenses:FetchedResults<Expense>

  private func filterTags() {
    if selectedTags.isEmpty {
      return
    }
      let selectedTagNames = selectedTags.map { $0.name }

      let request = Expense.fetchRequest()
      request.predicate = NSPredicate(format: "ANY tags.name IN %@", selectedTagNames)

      do {
          filteredExpenses = try context.fetch(request)
      } catch {
          print(error)
      }
  }

  private func filterByPrice() {
    guard let startPrice = startPrice, let endPrice = endPrice else { return }
    let request = Expense.fetchRequest()
    request.predicate = NSPredicate(format:"amount >= %@ AND amount <= %@", NSNumber(value: startPrice), NSNumber(value: endPrice))
    do {
        filteredExpenses = try context.fetch(request)
    } catch {
        print(error)
    }
  }

  private func filterByTitle() {
    let request = Expense.fetchRequest()
    request.predicate = NSPredicate(format:"title BEGINSWITH %@", title)
    do {
      filteredExpenses = try context.fetch(request)
    } catch {
      print(error.localizedDescription)
    }
  }

  private func filterByDate() {
    let request = Expense.fetchRequest()
    request.predicate = NSPredicate(format:"dateCreated >= %@ AND dateCreated <= %@", startDate as NSDate, endDate as NSDate)
    do {
      filteredExpenses = try context.fetch(request)
    } catch {
      print(error.localizedDescription)
    }
  }

    var body: some View {
      List {
        //filter by Tag
        Section("Filter By Tag") {
          TagView(selectedTags: $selectedTags)
            .onChange(of: selectedTags, filterTags)
        }
        //filter by price
        Section("Filter By Price") {
          TextField("Start Price", value: $startPrice, format: .number)
          TextField("End Price", value: $endPrice, format: .number)
          Button {
            filterByPrice()
          } label: {
            Text("Search")
          }
        }
        // filter by title
        Section("Filter By Title") {
          TextField("Title", text: $title)
          Button {
            filterByTitle()
          } label: {
            Text("Search")
          }
        }
        //filter by Date
        Section ("Filter By date") {
          DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
          DatePicker("End Date", selection: $endDate, displayedComponents: .date)
          Button {
            filterByDate()
          } label: {
            Text("Search")
          }
        }

        ForEach(filteredExpenses) {
          expense in
          ExpenseCellView(expense: expense)
        }
        Spacer()
        HStack {
          Spacer()
          Button {
            selectedTags  = []
            filteredExpenses = expenses.map{$0}
          } label: {
            Text("Show All")
          }
          Spacer()
        }
      }
      .onChange(of:showAll, initial:  false) {
        print("All change")
        showAll = false
      }
      .navigationTitle("Filter")
      .padding()
    }
}

#Preview {
  NavigationStack {
    FilterScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.context)
  }
}
