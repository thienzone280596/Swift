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
  @State private var selectedSortOption:SortOptions? = nil
  @State private var selectedSortDirection:SortDirection? = nil
  @State private var selectedFilterOption:FilterOption? = nil

  private enum FilterOption:Identifiable, Equatable {
    case none
    case byTags(Set<Tag>)
    case byPriceRange(minPrice:Double, maxPrice:Double)
    case byTitle(String)
    case byDate(startDate:Date, endDate:Date)

    var id:String {
      switch self {
      case .none:
        return "none"
      case .byTags:
        return "tags"
      case .byPriceRange:
        return "priceRange"
      case .byTitle:
        return "title"
      case .byDate:
        return "date"
      }
    }
  }

  private enum SortDirection:CaseIterable, Identifiable {
    case asc
    case desc
    var id:SortDirection {
      return self
    }

    var title: String {
      switch self {
      case .asc:
        return "Ascending"
      case .desc:
        return "Descending"
      }
    }
  }

  private enum SortOptions:String, CaseIterable, Identifiable {
    case title
    case date
    var id: SortOptions {
      return self
    }

    var title: String {
      switch self {
      case .title:
        return "Title"
      case .date:
        return "Date"
      }
    }

    var key:String {
     rawValue
    }
  }

  @FetchRequest(sortDescriptors: []) private var expenses:FetchedResults<Expense>

  // TODO: - performSort
  private func performSort() {
    guard let sortOption = selectedSortOption else { return}
    let request = Expense.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: sortOption.key, ascending: selectedSortDirection == .asc ? true :false)]

    do {
      filteredExpenses = try context.fetch(request)
    } catch {
      print(error.localizedDescription)
    }
  }
  //todo perform filter
  private func performfilter() {
    //check nil
    guard let selectedFilterOption = selectedFilterOption else { return }
    let request = Expense.fetchRequest()

    switch selectedFilterOption {
    case .none:
      request.predicate = NSPredicate(value: true)
    case .byTags(_):
      let tagNames = selectedTags.map { $0.name }
      request.predicate = NSPredicate(format: "ANY tags.name IN %@", tagNames)
    case .byPriceRange(minPrice: let minPrice, maxPrice: let maxPrice):
      request.predicate = NSPredicate(format:"amount >= %@ AND amount <= %@", NSNumber(value: minPrice), NSNumber(value: maxPrice))
    case .byTitle(let title):
      request.predicate = NSPredicate(format:"title BEGINSWITH %@", title)
    case .byDate(startDate: let startDate, endDate: let endDate):
      request.predicate = NSPredicate(format:"dateCreated >= %@ AND dateCreated <= %@", startDate as NSDate, endDate as NSDate)
    }

    do {
      filteredExpenses = try context.fetch(request)
    } catch {
      print(error)
    }
  }

    var body: some View {
      List {
        Section("Sort") {
          Picker("Sort Options", selection: $selectedSortOption) {
            Text("Select").tag(Optional<SortOptions>(nil))
            ForEach(SortOptions.allCases) {
              option in
              Text(option.title)
                .tag(Optional(option))
            }
          }


          Picker("Sort Direction", selection: $selectedSortDirection) {
            Text("Select").tag(Optional<SortDirection>(nil))
            ForEach(SortDirection.allCases) {
              direction in
              Text(direction.title)
                .tag(Optional(direction))
            }
          }

          Button {
            performSort()
          } label: {
            Text("Sort")
          }

        }
        //filter by Tag
        Section("Filter By Tag") {
          TagView(selectedTags: $selectedTags)
            .onChange(of: selectedTags,{
              selectedFilterOption = .byTags(selectedTags)
            })
        }
        //filter by price
        Section("Filter By Price") {
          TextField("Start Price", value: $startPrice, format: .number)
          TextField("End Price", value: $endPrice, format: .number)
          Button {
            guard let startPrice = startPrice, let endPrice = endPrice else {
              return
            }
            selectedFilterOption = .byPriceRange(minPrice: startPrice, maxPrice: endPrice)
          } label: {
            Text("Search")
          }
        }
        // filter by title
        Section("Filter By Title") {
          TextField("Title", text: $title)
          Button {
            selectedFilterOption = .byTitle(title)
          } label: {
            Text("Search")
          }
        }
        //filter by Date
        Section ("Filter By date") {
          DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
          DatePicker("End Date", selection: $endDate, displayedComponents: .date)
          Button {
            selectedFilterOption = .byDate(startDate: startDate, endDate: endDate)
          } label: {
            Text("Search")
          }
        }

        Section("Expense") {
          ForEach(filteredExpenses) {
            expense in
            ExpenseCellView(expense: expense)
          }
        }

        HStack {
          Spacer()
          Button {
            selectedFilterOption = FilterOption.none
          } label: {
            Text("Show All")
          }
          Spacer()
        }
      }
      .onChange(of: selectedFilterOption, {
        performfilter()
      })
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
