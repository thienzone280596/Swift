# PassthroughSubject and CurrentValueSubject

In SwiftUI, using Combine for reactive programming involves understanding the difference between `PassthroughSubject` and `CurrentValueSubject`, both of which are types of subjects that can be used to publish and manage streams of values. Here's a detailed look at the differences:

### 1. **PassthroughSubject**

- **Description**: `PassthroughSubject` is a subject that doesn’t store any value. It only passes along (or "publishes") new values to its subscribers as they arrive. If a subscriber subscribes after some values have already been sent, it won’t receive those past values—only the new ones that come in after the subscription.

- **Use Case**: This is useful when you want to broadcast events that don’t have a persistent state, such as UI events (e.g., button taps) or one-off notifications where past values aren’t relevant.

- **Example**:

  ```swift
  
  import Combine
  
  let passthroughSubject = PassthroughSubject<String, Never>()
  
  let subscriber1 = passthroughSubject.sink { value in
      print("Subscriber 1 received: \(value)")
  }
  
  passthroughSubject.send("Hello")
  // Output: "Subscriber 1 received: Hello"
  
  let subscriber2 = passthroughSubject.sink { value in
      print("Subscriber 2 received: \(value)")
  }
  
  passthroughSubject.send("World")
  // Output: "Subscriber 1 received: World"
  // Output: "Subscriber 2 received: World"
  ```

  **Key Characteristics**:

  - Does not retain the last sent value.
  - Subscribers only receive events emitted after they have subscribed.
  - Useful for transient events where past values are irrelevant.

### 2. **CurrentValueSubject**

- **Description**: `CurrentValueSubject` is a subject that stores and emits the most recent value to new subscribers. When a new subscriber subscribes, it immediately receives the current value stored in the `CurrentValueSubject`, and then continues to receive any new values that are emitted. It always has a value, even before any values are explicitly sent.

- **Use Case**: This is ideal when you need to keep track of a state or a value that can change over time, and you want new subscribers to always have the latest information upon subscription.

- **Example**:

  ```swift
  
  import Combine
  
  let currentValueSubject = CurrentValueSubject<String, Never>("Initial Value")
  
  let subscriber1 = currentValueSubject.sink { value in
      print("Subscriber 1 received: \(value)")
  }
  // Output: "Subscriber 1 received: Initial Value"
  
  currentValueSubject.send("Hello")
  // Output: "Subscriber 1 received: Hello"
  
  let subscriber2 = currentValueSubject.sink { value in
      print("Subscriber 2 received: \(value)")
  }
  // Output: "Subscriber 2 received: Hello"
  
  currentValueSubject.send("World")
  // Output: "Subscriber 1 received: World"
  // Output: "Subscriber 2 received: World"
  ```

  **Key Characteristics**:

  - Stores the latest value and immediately sends it to new subscribers.
  - Always holds a value, which is provided at initialization.
  - Useful for representing a state or any value that needs to be retained and accessible at all times.

### **Summary of Differences**:

- **Value Storage**:
  - `PassthroughSubject`: Does not store values; only passes through new values to subscribers.
  - `CurrentValueSubject`: Stores the most recent value and immediately sends it to new subscribers.
- **Subscriber Experience**:
  - `PassthroughSubject`: Subscribers only get values that are published after they subscribe.
  - `CurrentValueSubject`: Subscribers immediately receive the current value upon subscription, followed by any new values.
- **Initialization**:
  - `PassthroughSubject`: Does not require an initial value.
  - `CurrentValueSubject`: Requires an initial value upon creation.

Choosing between `PassthroughSubject` and `CurrentValueSubject` depends on whether you need to keep track of a state (use `CurrentValueSubject`) or if you simply need to broadcast events without storing them (use `PassthroughSubject`).