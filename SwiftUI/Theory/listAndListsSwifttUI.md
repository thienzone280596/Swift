# List and List Object swiftUI

SwiftUI provides a powerful and flexible way to create and manage lists using the `List` view. The `List` view allows you to display a scrollable collection of views, such as text, images, or custom views, in a vertically stacked layout. Here’s a comprehensive guide on creating and managing lists with `List` in SwiftUI.

### 1. Creating a Basic List

A basic list can be created using an array of data and iterating over it with `ForEach`.

```swift
import SwiftUI

struct ContentView: View {
    let fruits = ["Apple", "Banana", "Orange", "Grapes", "Strawberry"]

    var body: some View {
        List(fruits, id: \.self) { fruit in
            Text(fruit)
        }
    }
}

```

### 2. Creating a List Object

If your data model conforms to the `Identifiable` protocol, you can simplify the creation of lists.

```swift
struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Grapes"),
        Fruit(name: "Strawberry")
    ]

    var body: some View {
        List(fruits) { fruit in
            Text(fruit.name)
        }
    }
}
```

Customizing List Rows

You can create custom list rows by using custom views.

```swift
struct FruitRow: View {
    let fruit: Fruit

    var body: some View {
        HStack {
            Image(systemName: "applelogo")
            Text(fruit.name)
        }
    }
}

struct ContentView: View {
    let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Grapes"),
        Fruit(name: "Strawberry")
    ]

    var body: some View {
        List(fruits) { fruit in
            FruitRow(fruit: fruit)
        }
    }
}
```

### Adding Sections to a List

You can group list items into sections using `Section`.

```swift
struct ContentView: View {
    let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Grapes"),
        Fruit(name: "Strawberry")
    ]
    let vegetables = [
        Fruit(name: "Carrot"),
        Fruit(name: "Potato"),
        Fruit(name: "Tomato")
    ]

    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                ForEach(fruits) { fruit in
                    Text(fruit.name)
                }
            }

            Section(header: Text("Vegetables")) {
                ForEach(vegetables) { vegetable in
                    Text(vegetable.name)
                }
            }
        }
    }
}
```

### Handling List Selection

To handle selection in a list, you can use `NavigationLink` within the list.

```swift
struct FruitDetailView: View {
    let fruit: Fruit

    var body: some View {
        Text("You selected \(fruit.name)")
            .font(.largeTitle)
    }
}

struct ContentView: View {
    let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Grapes"),
        Fruit(name: "Strawberry")
    ]

    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                    Text(fruit.name)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}
```

### Adding and Removing Items

To allow dynamic adding and removing of items, you can use a state variable.

```swift
struct ContentView: View {
    @State private var fruits = ["Apple", "Banana", "Orange", "Grapes", "Strawberry"]

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle("Fruits")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: addFruit) {
                    Image(systemName: "plus")
                }
            )
        }
    }

    func delete(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
    }

    func addFruit() {
        fruits.append("New Fruit")
    }
}
```

