# Views and Modifiers in SwiftUI

SwiftUI is built on a declarative(khai báo) syntax that allows you to construct complex UIs using simple and composable components known as views. You can enhance(nâng cao) these views using modifiers to alter their appearance and behavior (giao Diện và hành vi)

#### Basic Views

1. **Text** Displays a line of text.

   ```swift
   Text("Hello, SwiftUI!")
   ```

2. **Image** Displays an image.

   ```swift
   Image(systemName: "star.fill")
   ```

3. **Shapes** Simple shapes like rectangles, circles, and ellipses.

   ```swift
   Circle()
   Rectangle()
   Ellipse()
   ```

4. **Stacks** Layout views horizontally, vertically, or in a depth-wise stack

   ```swift
   VStack {
       Text("Top")
       Text("Bottom")
   }
   
   HStack {
       Text("Left")
       Text("Right")
   }
   
   ZStack {
       Text("Background")
       Text("Foreground")
   }
   
   ```

5. **List** Displays a scrollable list of data.

   ```swift
   List {
       Text("Item 1")
       Text("Item 2")
       Text("Item 3")
   }
   ```

6. **NavigationView and NavigationLink** Enable navigation between views.

   ```swift
   NavigationView {
       NavigationLink(destination: DetailView()) {
           Text("Go to Detail View")
       }
       .navigationTitle("Main View")
   }
   ```

   ### Modifiers

   Modifiers are methods that you chain to a view to change its appearance or behavior. Each modifier returns a new view

   #### Common Modifiers

   1. **font** Changes the font of a text view.

      ```swift
      Text("Hello, SwiftUI!")
          .font(.title)
      ```

    2. **foregroundColor** Changes the color of a view's foreground content.

       ```swift
       Text("Hello, SwiftUI!")
           .foregroundColor(.red)
       ```

    3. **padding** Adds space around a view.

       ```swift
       Text("Hello, SwiftUI!")
           .padding()
       ```

    4. **cornerRadius** Adds rounded corners to a view.

       ```swift
       Text("Hello, SwiftUI!")
           .padding()
           .background(Color.yellow)
           .cornerRadius(10)
       ```

   6. **frame** Sets the size of a view.

      ```swift
      Text("Hello, SwiftUI!")
          .frame(width: 200, height: 100)
      ```

   7. **opacity** Changes the opacity of a view.

      ```swift
      Text("Hello, SwiftUI!")
          .opacity(0.5)
      ```

   8. **shadow** Adds a shadow to a view.

      ```swift
      Text("Hello, SwiftUI!")
          .shadow(color: .gray, radius: 2, x: 0, y: 2)
      ```

   9. **border** Adds a border to a view.

      ```swift
      Text("Hello, SwiftUI!")
          .padding()
          .border(Color.red, width: 2)
      ```

### Combining Views and Modifiers

You can combine multiple views and apply modifiers to create complex UIs.

```swift
struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.purple)
            .cornerRadius(10)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

extension View {
    func customStyle() -> some View {
        self.modifier(CustomModifier())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .customStyle()
    }
}
```

### Custom Modifiers

You can create custom modifiers by conforming to the `ViewModifier` protocol.

```swift
struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.purple)
            .cornerRadius(10)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

extension View {
    func customStyle() -> some View {
        self.modifier(CustomModifier())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .customStyle()
    }
}
```

