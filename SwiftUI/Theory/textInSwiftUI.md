# Text in SwiftUI

In SwiftUI, `Text` is one of the fundamental views used to display read-only text.

### Basic Text Usage

To display a simple line of text, you use the `Text` view:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
    }
}
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.18.14.png)

### Customizing Text Appearance

#### Font

You can change the font of the text using the `.font()` modifier:

```swift
Text("Hello, SwiftUI!")
    .font(.largeTitle)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.22.53.png)



#### Font Weight

Adjust (điều chỉnh) the weight (thickness) of the font using `.fontWeight()`:

```swift
Text("Hello, SwiftUI!")
    .fontWeight(.bold)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.25.04.png)

#### Font Style

You can apply a specific font style using `.font(.system(size:weight:design:))` or other predefined styles like `.italic()`, `.bold()`, etc.:

```swift
Text("Text Font style")
    .font(.system(size: 24, weight: .semibold, design: .rounded))
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.27.37.png)

#### Color

Change the text color using `.foregroundColor()`:

```swift
Text("Text Color")
    .foregroundColor(.blue)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.29.43.png)

### Text Alignment

#### Multiline Text Alignment

Align the text in multiline scenarios using `.multilineTextAlignment()`:

```swift
Text("This is a long line of text that will wrap onto multiple lines. This is an example of multiline text alignment.")
    .multilineTextAlignment(.center)
    .frame(width: 200)  // Restrict width to demonstrate wrapping
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.31.24.png)

### Text Modifiers

#### Background and Padding

Add a background color and padding to the text:

```swift
Text("Background and padding Text")
     .padding()
     .background(Color.yellow)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.33.56.png)

#### Border

Add a border around the text:

```swift
Text("Border Text")
    .padding()
    .border(Color.red, width: 2)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.35.42.png)

#### Shadow

Add a shadow to the text:

```swift
Text("Shadow Text")
    .shadow(color: .gray, radius: 2, x: 0, y: 2)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 11.37.44.png)

#### Strikethrough and Underline

Apply strikethrough or underline styles:

```swift
Text("Strikethrough and Underline")
    .strikethrough(true, color: .red)
    .underline(true, color: .blue)
```

![markdown](/Users/thientran/Documents/Swift/Swift/assets/Screenshot 2024-07-19 at 14.19.35.png)

### Handling Accessibility

#### Accessibility Identifiers

Add accessibility identifiers for UI testing:

```swift
Text("Hello, SwiftUI!")
    .accessibilityIdentifier("greetingText")
```

