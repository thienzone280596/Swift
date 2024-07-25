# GeometryReader SwiftUI

`GeometryReader` is a powerful and flexible view in SwiftUI that allows you to dynamically read and respond to the size and position of views within a layout. It provides the size and coordinates of its child views, enabling you to create responsive and adaptive layouts.

### Basic Usage

The `GeometryReader` view takes a closure that receives a `GeometryProxy` instance, which provides information about the container's size and position.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .background(Color.blue)
                .foregroundColor(.white)
        }
        .background(Color.gray)
    }
}
```

### GeometryProxy

The `GeometryProxy` provides several properties and methods to get the size and position of the container:

- `size`: The size of the container.
- `safeAreaInsets`: The safe area insets of the container.
- `frame(in:)`: The frame of the container relative to a given coordinate space (e.g., `.local`, `.global`).

### Example with GeometryProxy

Here’s an example that uses `GeometryProxy` to create a responsive layout:

```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Top Text")
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                    .background(Color.red)
                Text("Bottom Text")
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    .background(Color.blue)
            }
        }
    }
}
```

### Responsive Design

Using `GeometryReader` for responsive design allows your layout to adapt to different screen sizes and orientations.

#### Example: Centering a View

```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Centered Text")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.1)
                    .background(Color.green)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}
```

### Using GeometryReader with Safe Area Insets

You can access the safe area insets using `geometry.safeAreaInsets` to adjust your layout accordingly.

```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Top Text")
                    .padding(.top, geometry.safeAreaInsets.top)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    .background(Color.red)
                Text("Bottom Text")
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                    .background(Color.blue)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
```

### Example with Nested GeometryReader

You can nest `GeometryReader` views to get size and position information for different parts of your layout.

```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { outerGeometry in
            VStack {
                Text("Outer Width: \(outerGeometry.size.width)")
                GeometryReader { innerGeometry in
                    Text("Inner Width: \(innerGeometry.size.width)")
                        .frame(width: innerGeometry.size.width / 2, height: innerGeometry.size.height / 2)
                        .background(Color.green)
                }
                .background(Color.yellow)
            }
        }
        .background(Color.gray)
    }
}
```

