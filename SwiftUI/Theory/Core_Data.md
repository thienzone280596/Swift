# Core Data

The Core Data stack is the fundamental part of a Core Data application in Swift. It manages the model layer, which includes the data model, the persistent store, and the objects within the context. Here's a basic setup of a Core Data stack in Swift:

### 1. **Data Model (Managed Object Model)**

This is typically created using the `.xcdatamodeld` file in Xcode, where you define your entities, attributes, and relationships (Đây là mô hình dữ liệu chứa các thực thể (entities), thuộc tính (attributes) và mối quan hệ (relationships) mà bạn định nghĩa trong mô hình dữ liệu Core Data.)

### 2. **Persistent Container**

`NSPersistentContainer` is the central object in the Core Data stack. It encapsulates the entire Core Data stack and provides a convenient interface for managing the model and context (Đây là một đối tượng giúp đơn giản hóa việc thiết lập Core Data Stack. Nó tự động quản lý NSManagedObjectModel, NSPersistentStoreCoordinator và NSManagedObjectContext, giúp khởi tạo và cấu hình Core Data dễ dàng hơn.)

### 3. **Managed Object Context**

The `NSManagedObjectContext` is responsible for managing a collection of managed objects. It handles object lifecycle management, change tracking, and persistence. (Là một môi trường trong đó bạn có thể làm việc với các đối tượng Core Data. Mọi thao tác đọc, ghi hoặc xóa dữ liệu đều được thực hiện thông qua context này. Có thể hiểu nó như một sandbox mà các thay đổi chỉ được ghi nhận chính thức khi bạn lưu (save) context.)

### 4. **Persistent Store Coordinator**

The `NSPersistentStoreCoordinator` handles the connection between the managed object model and the persistent store (e.g., SQLite database). It's responsible for coordinating multiple persistent stores and mapping entities to the stores. (Phối hợp viên lưu trữ bền vững chịu trách nhiệm quản lý các persistent stores (thường là một SQLite database) và tạo kết nối giữa NSManagedObjectContext và các dữ liệu thực tế trong lưu trữ.)

![What Is the Core Data Stack](https://cocoacasts.s3.amazonaws.com/what-is-the-core-data-stack/figure-core-data-stack-1.jpg)

### 5. **Setting Up the Core Data Stack**

Here’s a basic implementation of the Core Data stack in Swift:

```swift
swift
Sao chép mã
import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()

    private init() {} // Singleton pattern

    // Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ModelName") // Replace with your model name
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // Managed Object Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Save context
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
```

### 6. **Using the Core Data Stack**

To use the Core Data stack in your application:

- **Fetching Data**: You can use `NSFetchRequest` with the managed object context to retrieve data from the persistent store.

  ```swift
  swift
  Sao chép mã
  let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EntityName")
  do {
      let results = try CoreDataStack.shared.context.fetch(fetchRequest)
      // Use your fetched results
  } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
  }
  ```

- **Saving Data**: Create a new managed object and save the context.

  ```swift
  swift
  Sao chép mã
  let entity = NSEntityDescription.entity(forEntityName: "EntityName", in: CoreDataStack.shared.context)!
  let newObject = NSManagedObject(entity: entity, insertInto: CoreDataStack.shared.context)
  newObject.setValue("Sample Value", forKey: "attributeName")
  CoreDataStack.shared.saveContext()
  ```

### 7. **Error Handling**

Proper error handling is essential to manage situations where the Core Data stack fails, such as failing to load the persistent store.

This setup provides a basic and clean way to work with Core Data in a Swift application. It encapsulates the Core Data stack in a singleton for easy access across the app, making it easier to manage the data layer.