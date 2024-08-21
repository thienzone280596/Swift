//
//  ContentView.swift
//  Todo-CoreData
//
//  Created by ThienTran on 18/8/24.
//

import SwiftUI


struct ContentView: View {
  @Environment(\.managedObjectContext) private var context
  @State private var title:String = ""
  @FetchRequest(sortDescriptors: []) private var todoItems:FetchedResults<TodoItem>



  private var isFormValid:Bool {
    return !title.isEmptyOrWhitespace
  }
  
  private var pendingTodoItems: [TodoItem] {
    todoItems.filter{!$0.isCompleted}
  }

  private var compleatedTaskItems: [TodoItem] {
    todoItems.filter{$0.isCompleted}
  }

  private func saveTodoItem() {
    let todoItem = TodoItem(context: context)
    todoItem.title = title
    do {
     try context.save()
    } catch {
      print(error)
    }
  }
   // TODO: - update todo item
  private func updateTodoItem(_ todoItem:TodoItem) {
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
  private func deleteTodoItem(todoItem:TodoItem) {
    context.delete(todoItem)
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
    var body: some View {
        VStack {
          TextField("title",text: $title)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              if isFormValid {
                saveTodoItem()
                title = ""
              }
            }
          List{
            Section("Pending") {
              if pendingTodoItems.isEmpty {
                ContentUnavailableView("No itmes found", systemImage: "doc")
              } else {
                ForEach(pendingTodoItems) { todoItem in
                  TodoCellView(todoItem: todoItem, onchange: updateTodoItem(_:))
                }
                .onDelete(perform: { indexSet in
                  indexSet.forEach { index in
                    let todoItem = pendingTodoItems[index]
                    deleteTodoItem(todoItem: todoItem)
                  }
                })
              }

            }
            Section("Completed") {
              if compleatedTaskItems.isEmpty {
                ContentUnavailableView("No itmes found", systemImage: "doc")
              } else {
                ForEach(compleatedTaskItems) { todoItem in
                  TodoCellView(todoItem: todoItem, onchange: updateTodoItem(_:))
                }
                .onDelete(perform: { indexSet in
                  indexSet.forEach { index in
                    let todoItem = compleatedTaskItems[index]
                    deleteTodoItem(todoItem: todoItem)
                  }
                })
              }
            }

          }
          .listStyle(.plain)
        }
        .padding()
        .navigationTitle("Todo")
    }
}


struct TodoCellView:View {
  let todoItem:TodoItem
  let onchange:(TodoItem) -> Void

  var body: some View {
    HStack {
      Image(systemName: todoItem.isCompleted ? "checkmark.square": "square")
        .onTapGesture {
          todoItem.isCompleted = !todoItem.isCompleted
          onchange(todoItem)
        }
      if todoItem.isCompleted {
        Text(todoItem.title ?? "")
      } else {
        TextField("", text: Binding(get: {
          todoItem.title ?? ""
        }, set: { newValue in
          todoItem.title = newValue
        }))
        .onSubmit {
          onchange(todoItem)
        }
      }
    }
  }
}
#Preview {
  NavigationStack {
      ContentView()
          .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
