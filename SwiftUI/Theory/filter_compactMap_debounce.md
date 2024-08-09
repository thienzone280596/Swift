#  Filtering operators (filter, compactMap, debounce, etc.) in SwiftUI

### 1. `filter`

The `filter` function is used to create a new collection by including only those elements that meet a certain condition.

**Example with an Array:**

```swift
let numbers = [1, 2, 3, 4, 5, 6]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
// evenNumbers = [2, 4, 6]
```

In this example, the `filter` function iterates through the `numbers` array and returns a new array containing only the elements that are even.

### 2. `compactMap`

The `compactMap` function transforms elements of a collection using a closure that returns an optional value and automatically removes any `nil` values from the result.

**Example with an Array:**

```swift
let numbers = ["1", "2", "three", "4", "five"]
let validNumbers = numbers.compactMap { Int($0) }
// validNumbers = [1, 2, 4]
```

In this case, `compactMap` attempts to convert each string in the array to an integer. If the conversion fails (as with "three" and "five"), `nil` is returned, and `compactMap` excludes those `nil` values from the final array.

### 3. `debounce`(in ra giá trị cuối cùng phát ra)

The `debounce` operator is used in asynchronous programming, especially with Combine, to limit the rate at which events are emitted. It only allows an event to be published after a specified time interval has passed without any other events being published. This is particularly useful for scenarios like search fields, where you don’t want to send a request for every single keystroke but rather wait until the user has stopped typing for a moment.

```swift
import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()

let debounced = subject
    .debounce(for: .seconds(1), scheduler: RunLoop.main)
    .sink { value in
        print("Received value: \(value)")
    }

subject.send("Hello")
subject.send("Hello, w")
subject.send("Hello, wo")
subject.send("Hello, wor")
subject.send("Hello, world!")

// Output after 1 second of inactivity: "Received value: Hello, world!"
```

In this example, the `debounce` operator will delay the emission of the last value sent to the `subject` until 1 second has passed without any new values being sent. Only the final value will be printed after the user stops typing.

### Summary:

- **`filter`**: Creates a new collection containing only elements that satisfy a given condition.
- **`compactMap`**: Transforms elements of a collection, removing `nil` values from the result.
- **`debounce`**: Controls the rate of event emissions, only sending the latest event after a specified interval of inactivity.

These functions and operators are essential for efficiently handling data transformations and managing streams of events in Swift.