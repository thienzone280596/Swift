//
//  Todo_CoreDataApp.swift
//  Todo-CoreData
//
//  Created by ThienTran on 18/8/24.
//

import SwiftUI
import CoreData

@main
struct Todo_CoreDataApp: App {
  let provider = CoreDataProvider()
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            ContentView()
            .environment(\.managedObjectContext, provider.viewContext)
          }

        }
    }
}
