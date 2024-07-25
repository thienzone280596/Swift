# SwiftUI Syntax

### 1. **Basic Structure of a SwiftUI View**

A SwiftUI view is a structure that conforms to the `View` protocol. The body property of this structure defines the view's content and layout.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}
```

### 2. **Views and Modifiers**

In SwiftUI, you build your UI by combining views and applying modifiers to them.

#### Common Views:

- `Text`: Displays a string of text.
- `Image`: Displays an image.
- `VStack`: Vertically stacks views.
- `HStack`: Horizontally stacks views.
- `ZStack`: Overlays views on top of each other.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            HStack {
                Text("Left")
                Text("Right")
            }
        }
        .padding()
    }
}
```

### 3. **Modifiers** (Chỉnh sửa)

Modifiers are methods that you use to adjust the appearance and behavior of a view. Each modifier returns a new view.

#### Example Modifiers:

- `.font()`
- `.foregroundColor()`
- `.padding()`
- `.background()`
- `.cornerRadius()`

```swift
Text("Hello, SwiftUI!")
    .font(.title)
    .foregroundColor(.red)
    .padding()
    .background(Color.yellow)
    .cornerRadius(10)
```

### 4. **State and Binding**

State management is essential in SwiftUI. You use `@State` for local state within a view and `@Binding` for passing state between views.

#### Example:

```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button(action: {
                count += 1
            }) {
                Text("Increment")
            }
        }
        .padding()
    }
}

```

### 5. **Navigation and Stacks**

SwiftUI uses `NavigationView` and `NavigationLink` to handle navigation between views.

#### Example:

```swift
struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail View")
                }
            }
            .navigationTitle("Main View")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
            .navigationTitle("Detail View")
    }
}

```

### 6. **Lists and ForEach**

Use `List` to create scrollable lists of data. `ForEach` helps iterate over a collection to generate views dynamically.

#### Example:

```swift
struct ContentView: View {
    let items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

```

### 7. **Combining Views**

You can create reusable components by combining views.

#### Example:

```swift
struct CustomButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CustomButton(label: "Tap Me", action: {
                print("Button tapped")
            })
        }
    }
}

```

