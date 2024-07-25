# Image In SwiftUI

In SwiftUI, the `Image` view is used to display images within your user interface. You can customize images using various modifiers to fit your design needs. Here is a comprehensive guide on how to use and customize images in SwiftUI.

### Basic Image Usage

#### System Images (SF Symbols)

SF Symbols are a set of over 1,500 symbols that you can use in your app.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "star.fill")
    }
}
```

### Image Modifiers

#### Resizing and Scaling

You can resize and scale images using `.resizable()`, `.aspectRatio()`, and `.scaledToFit()` or `.scaledToFill()`.

```swift
Image("exampleImage")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 100, height: 100)
```

#### Clipping and Masking

Clip an image to a specific shape:

```swift
Image("exampleImage")
    .resizable()
    .frame(width: 100, height: 100)
    .clipShape(Circle())
```

Or use a custom mask:

```swift
Image("exampleImage")
    .resizable()
    .frame(width: 100, height: 100)
    .mask(Text("SWIFTUI").font(.largeTitle))
```

#### Borders and Shadows

Add borders and shadows to images:

```swift
Image("exampleImage")
    .resizable()
    .frame(width: 100, height: 100)
    .border(Color.black, width: 2)
    .shadow(color: .gray, radius: 5, x: 0, y: 5)
```

#### Tinting

Apply a color tint to an image (useful with SF Symbols):

```
Image(systemName: "star.fill")
    .foregroundColor(.yellow)
```

### Loading Remote Images

To load images from the internet, you can use the `AsyncImage` view available in SwiftUI 3.0 and later, or integrate third-party libraries such as `SDWebImageSwiftUI`.

#### Using AsyncImage (SwiftUI 3.0+)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://example.com/image.png")) { phase in
            if let image = phase.image {
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 100, height: 100)
            } else if phase.error != nil {
                Text("Failed to load image")
            } else {
                ProgressView()
            }
        }
    }
}
```

