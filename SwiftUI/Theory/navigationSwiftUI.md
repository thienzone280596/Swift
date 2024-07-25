# NavigationStack and NavigationLink

`NavigationView` and `NavigationLink` are essential components in SwiftUI for building navigation-based user interfaces. They allow you to create a navigation stack where users can move between different views. Below is a detailed guide on how to use `NavigationView` and `NavigationLink`.

### NavigationStack

`NavigationStack` is used to create a stack-based navigation interface, where you can push and pop views onto the navigation stack.

Basic Usage

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to Detail View", destination: DetailView())
                    .navigationTitle("Home")
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
    }
}
```

### NavigationStack with Data

You can use `NavigationStack` to manage navigation with dynamic data, allowing you to navigate based on the data items.

```swift
import SwiftUI

struct ContentView: View {
    let items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(item, value: item)
            }
            .navigationDestination(for: String.self) { item in
                DetailView(item: item)
            }
            .navigationTitle("Items")
        }
    }
}

struct DetailView: View {
    let item: String

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}

```

### NavigationSplitView

`NavigationSplitView` provides a way to create a master-detail interface, which is especially useful for iPad and Mac applications. It automatically adapts to different screen sizes and provides a sidebar for navigation.

#### Basic Usage

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            DetailView()
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink("Item 1", destination: DetailView(item: "Item 1"))
            NavigationLink("Item 2", destination: DetailView(item: "Item 2"))
            NavigationLink("Item 3", destination: DetailView(item: "Item 3"))
        }
        .navigationTitle("Sidebar")
    }
}

struct DetailView: View {
    var item: String = "Detail"

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}
```

### NavigationSplitView with Data

You can also use `NavigationSplitView` with dynamic data to create more complex navigation patterns.

```swift
import SwiftUI

struct ContentView: View {
    let items = ["Item 1", "Item 2", "Item 3"]

    @State private var selectedItem: String?

    var body: some View {
        NavigationSplitView {
            List(items, id: \.self, selection: $selectedItem) { item in
                Text(item)
            }
            .navigationTitle("Items")
        } detail: {
            if let selectedItem = selectedItem {
                DetailView(item: selectedItem)
            } else {
                Text("Select an item")
            }
        }
    }
}

struct DetailView: View {
    let item: String

    var body: some View {
        Text("Detail View for \(item)")
            .navigationTitle(item)
    }
}
```



### Key Differences

- **NavigationStack**:
  - Ideal for simple stack-based navigation.
  - Replaces `NavigationView` for pushing and popping views in a stack.
  - Easier to use with dynamic data and supports `navigationDestination` for handling various types of views based on data.
- **NavigationSplitView**:
  - Ideal for master-detail interfaces, especially on iPad and Mac.
  - Automatically adapts to different screen sizes and orientations.
  - Provides a sidebar and detail view layout, making it perfect for applications that require a split view.

### 