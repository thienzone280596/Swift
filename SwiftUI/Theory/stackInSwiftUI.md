# Stack View in SwiftUI (HStack, VStack, ZStack)

Stack views in SwiftUI are used to arrange (sắp xếp) child views in a specific order, either horizontally, vertically, or in layers. SwiftUI provides three types of stack views: `HStack`, `VStack`, and `ZStack`. Each type of stack view serves a different purpose and is essential for creating complex and responsive layouts.

### HStack

`HStack` arranges its child views in a horizontal line.

#### Basic Usage

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Left")
            Text("Center")
            Text("Right")
        }
    }
}
```

#### Spacing and Alignment

You can customize the spacing and alignment of the views within the `HStack`.

```swift
HStack(alignment: .top, spacing: 20) {
    Text("Left")
    Text("Center")
    Text("Right")
}
```

### VStack

`VStack` arranges its child views in a vertical line.

#### Basic Usage

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Top")
            Text("Middle")
            Text("Bottom")
        }
    }
}
```

### ZStack

`ZStack` overlays its child views on top of each other.

#### Basic Usage

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Bottom")
                .zIndex(0)
            Text("Middle")
                .zIndex(1)
            Text("Top")
                .zIndex(2)
        }
    }
}
```

#### Alignment

You can customize the alignment of the views within the `ZStack`.

```swift
ZStack(alignment: .topLeading) {
    Text("Bottom")
    Text("Top")
        .padding()
        .background(Color.yellow)
}
```

Stack views in SwiftUI are used to arrange child views in a specific order, either horizontally, vertically, or in layers. SwiftUI provides three types of stack views: `HStack`, `VStack`, and `ZStack`. Each type of stack view serves a different purpose and is essential for creating complex and responsive layouts.

### HStack

`HStack` arranges its child views in a horizontal line.

#### Basic Usage

```
swift
Sao chép mã
import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Left")
            Text("Center")
            Text("Right")
        }
    }
}
```

#### Spacing and Alignment

You can customize the spacing and alignment of the views within the `HStack`.

```
swift
Sao chép mã
HStack(alignment: .top, spacing: 20) {
    Text("Left")
    Text("Center")
    Text("Right")
}
```

### VStack

`VStack` arranges its child views in a vertical line.

#### Basic Usage

```
swift
Sao chép mã
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Top")
            Text("Middle")
            Text("Bottom")
        }
    }
}
```

#### Spacing and Alignment

You can customize the spacing and alignment of the views within the `VStack`.

```
swift
Sao chép mã
VStack(alignment: .leading, spacing: 10) {
    Text("Top")
    Text("Middle")
    Text("Bottom")
}
```

### ZStack

`ZStack` overlays its child views on top of each other.

#### Basic Usage

```
swift
Sao chép mã
struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Bottom")
                .zIndex(0)
            Text("Middle")
                .zIndex(1)
            Text("Top")
                .zIndex(2)
        }
    }
}
```

#### Alignment

You can customize the alignment of the views within the `ZStack`.

```
swift
Sao chép mã
ZStack(alignment: .topLeading) {
    Text("Bottom")
    Text("Top")
        .padding()
        .background(Color.yellow)
}
```

### Combining Stack Views

You can combine multiple stack views to create complex layouts.

#### Example

```
swift
Sao chép mã
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            .padding()
            .background(Color.gray)
            
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                Text("Hello, ZStack!")
                    .foregroundColor(.white)
            }
            .padding()
            
            HStack {
                VStack {
                    Text("A")
                    Text("B")
                }
                .padding()
                .background(Color.orange)
                
                VStack {
                    Text("X")
                    Text("Y")
                }
                .padding()
                .background(Color.purple)
            }
        }
        .padding()
    }
}
```

### Alignment Options

Each stack view type offers different alignment options:

- **HStack**: `alignment` parameter can be `.top`, `.center`, `.bottom`, or custom alignment guides.
- **VStack**: `alignment` parameter can be `.leading`, `.center`, `.trailing`, or custom alignment guides.
- **ZStack**: `alignment` parameter can be `.topLeading`, `.top`, `.topTrailing`, `.leading`, `.center`, `.trailing`, `.bottomLeading`, `.bottom`, `.bottomTrailing`, or custom alignment guides.