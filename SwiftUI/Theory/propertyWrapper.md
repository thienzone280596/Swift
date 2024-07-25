# Property wrapper @State, @Binding, @ObservedObject, @EnviromentObject?

## @State

SwiftUI uses the `@State` property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are value types.

When we put `@State` before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI. This means SwiftUI can destroy and recreate our struct whenever needed (and this can happen a lot!), without losing the state it was storing.

`@State` should be used with simple struct types such as `String`, `Int`, and arrays, and generally shouldn’t be shared with other views. If you want to share values across views, you should probably use `@ObservedObject` or `@EnvironmentObject` instead – both of those will ensure that all views will be refreshed when the data changes.

To re-enforce the local nature of `@State` properties, Apple recommends you mark them as `private`, like this:

```swift
@State private var username = ""
```

## @Binding

In SwiftUI, `@Binding` is a property wrapper used to create a two-way connection between a property that stores data and a view that can mutate that data. This allows you to pass state data down the view hierarchy and have child views update the state in the parent view.

### When to Use `@Binding`

You use `@Binding` when you want a child view to read and write a value that is owned by a parent view. This is particularly useful for creating reusable components that need to modify the state of their parent.

### Basic Usage

#### Example: Parent and Child View

Here’s a simple example demonstrating the use of `@Binding`:

1. **Parent View:**

   ```swift
   import SwiftUI
   
   struct ParentView: View {
       @State private var isToggled = false
   
       var body: some View {
           VStack {
               Text(isToggled ? "The toggle is ON" : "The toggle is OFF")
               ToggleView(isOn: $isToggled)
           }
           .padding()
       }
   }
   
   struct ToggleView: View {
       @Binding var isOn: Bool
   
       var body: some View {
           Toggle(isOn: $isOn) {
               Text("Toggle me")
           }
           .padding()
       }
   }
   ```

   ### Key Points

   1. **Creating a Binding**: In the parent view, use the `$` prefix to create a binding to the `@State` property.
   2. **Receiving a Binding**: In the child view, use the `@Binding` property wrapper to receive the binding.
   3. **Two-Way Binding**: The child view can both read and modify the state of the parent view.

   ### Using Bindings with Collections

   You can create bindings for elements within collections, making it easy to pass bindings for individual items in a list.

```swift
struct ItemListView: View {
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                ItemRow(item: self.$items[index])
            }
        }
    }
}

struct ItemRow: View {
    @Binding var item: String

    var body: some View {
        TextField("Item", text: $item)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
```

## @ObservedObject

In SwiftUI, `@ObservedObject` is a property wrapper used to create a reference to an observable object. This observable object conforms to the `ObservableObject` protocol and is capable of notifying its views about changes in its state. When an observable object changes, any view that depends on it will automatically update to reflect those changes.

### When to Use `@ObservedObject`

You use `@ObservedObject` when you have a data model or state that is shared across multiple views and you need those views to react to changes in the data.

### Basic Usage

#### Example: Observable Object

1. **Define an Observable Object:**

```swift
import SwiftUI
import Combine

class Counter: ObservableObject {
    @Published var value: Int = 0
}
```

In this example, the `Counter` class conforms to the `ObservableObject` protocol. The `@Published` property wrapper is used to mark properties that will trigger view updates when they change.

2. **Use `@ObservedObject` in a View:**

```swift
struct ContentView: View {
    @ObservedObject var counter = Counter()

    var body: some View {
        VStack {
            Text("Counter: \(counter.value)")
                .font(.largeTitle)
            Button(action: {
                counter.value += 1
            }) {
                Text("Increment")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
```

### Key Points

1. **ObservableObject Protocol**: The class you want to observe must conform to the `ObservableObject` protocol.
2. **@Published Properties**: Use the `@Published` property wrapper to automatically notify observers when a property changes.
3. **Automatic Updates**: Views using `@ObservedObject` will automatically update when the observed object's properties marked with `@Published` change.

### Example with Multiple Views

You can pass an observable object to multiple views and have them react to changes.

```swift
struct ParentView: View {
    @StateObject private var counter = Counter()

    var body: some View {
        VStack {
            ChildView(counter: counter)
            AnotherChildView(counter: counter)
        }
    }
}

struct ChildView: View {
    @ObservedObject var counter: Counter

    var body: some View {
        VStack {
            Text("Child View Counter: \(counter.value)")
            Button(action: {
                counter.value += 1
            }) {
                Text("Increment in Child")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct AnotherChildView: View {
    @ObservedObject var counter: Counter

    var body: some View {
        VStack {
            Text("Another Child Counter: \(counter.value)")
            Button(action: {
                counter.value += 1
            }) {
                Text("Increment in Another Child")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

```

### Lifecycle Management

1. **@StateObject**: Use `@StateObject` to create and manage the lifecycle of an observable object within a view. This ensures the object is created once and persists for the lifetime of the view.
2. **@ObservedObject**: Use `@ObservedObject` to observe an object that is owned and managed elsewhere (e.g., passed in from a parent view).

### Best Practices

1. **Use `@StateObject` for Creation**: Use `@StateObject` in the view where the observable object is created to ensure it is only created once.
2. **Use `@ObservedObject` for Dependency**: Use `@ObservedObject` in views that depend on an existing observable object.
3. **Keep Observable Object Logic Separate**: Keep business logic and state management in the observable object, separating it from the view.

```swift
struct ContentView: View {
    @StateObject private var counter = Counter()

    var body: some View {
        // Your view code here
    }
}
```

## @EnviromentObject

In SwiftUI, `@EnvironmentObject` is a property wrapper used to inject shared data into a view hierarchy. This allows you to pass an observable object through the view hierarchy without explicitly passing it from view to view. It's particularly useful for global or shared state that multiple views need to access and modify.

### When to Use `@EnvironmentObject`

You use `@EnvironmentObject` when you have an observable object that should be accessible by many views across your app, but you don't want to manually pass it through each view.

### Basic Usage

#### Step 1: Define an Observable Object

First, create a class that conforms to the `ObservableObject` protocol and use the `@Published` property wrapper for any properties that should trigger view updates.

```swift
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var username: String = "Guest"
}
```

#### Step 2: Provide the Observable Object

Next, provide the observable object to the environment. This is typically done at the top level of your view hierarchy, such as in your `App` struct.

```swift
@main
struct MyApp: App {
    @StateObject private var userSettings = UserSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
        }
    }
}
```

Here, the `UserSettings` object is created and provided to the environment using the `.environmentObject` modifier.

#### Step 3: Use the Environment Object in Views

Now, any view within the hierarchy can access the `UserSettings` object using the `@EnvironmentObject` property wrapper.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            GreetingView()
            UsernameEditorView()
        }
    }
}

struct GreetingView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        Text("Hello, \(userSettings.username)!")
            .padding()
    }
}

struct UsernameEditorView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        TextField("Enter username", text: $userSettings.username)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
```

