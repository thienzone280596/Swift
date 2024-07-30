# Modals and Sheets

In SwiftUI, `Modals` and `Sheets` are used to present new content temporarily on top of the current view. This allows users to interact with additional information or options without disrupting their current workflow. Here's an overview of how to use them effectively.

### Sheets

A `Sheet` in SwiftUI slides up from the bottom of the screen and is commonly used for displaying detail views, forms, or additional options.

#### Basic Usage of `Sheet`

To present a sheet, you use the `.sheet` modifier, which takes a binding to a boolean that controls whether the sheet is presented, and a closure that returns the content of the sheet.

```swift
import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false

    var body: some View {
        Button("Show Sheet") {
            isShowingSheet.toggle()
        }
        .sheet(isPresented: $isShowingSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    var body: some View {
        Text("This is a sheet!")
            .padding()
    }
}
```

#### Dismissing a Sheet

To dismiss a sheet, you can use the `@Environment` property wrapper to access the `presentationMode` environment value and call `dismiss()`.

```swift
struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a sheet!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}
```

### Full Screen Cover

`fullScreenCover` presents a view that covers the entire screen. This is useful for immersive experiences that require the user's full attention.

#### Basic Usage of `fullScreenCover`

```swift
import SwiftUI

struct ContentView: View {
    @State private var isShowingFullScreenCover = false

    var body: some View {
        Button("Show Full Screen Cover") {
            isShowingFullScreenCover.toggle()
        }
        .fullScreenCover(isPresented: $isShowingFullScreenCover) {
            FullScreenCoverView()
        }
    }
}

struct FullScreenCoverView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a full screen cover!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}
```

### Passing Data to Sheets and Full Screen Covers

You can pass data to sheets or full screen covers by using custom initializers for the presented views.

```swift
import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    @State private var selectedItem: String?

    var body: some View {
        VStack {
            Button("Show Sheet with Item") {
                selectedItem = "Item 1"
                isShowingSheet.toggle()
            }
            .sheet(isPresented: $isShowingSheet) {
                if let item = selectedItem {
                    SheetView(item: item)
                }
            }
        }
    }
}

struct SheetView: View {
    var item: String

    var body: some View {
        Text("Showing details for \(item)")
            .padding()
    }
}
```