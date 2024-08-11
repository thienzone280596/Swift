# CombineLatest, zip, switchToLatest

In Swift, particularly when working with the Combine framework, `combineLatest`, `zip`, and `switchToLatest` are powerful operators that help manage and combine asynchronous data streams. Here's an explanation of each:

### 1. `combineLatest`

The `combineLatest` operator merges the latest values from two or more publishers and emits a tuple containing these values whenever any of the publishers emit a new value. It waits until all publishers have emitted at least one value.

```swift
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let combined = Publishers.CombineLatest(publisher1, publisher2)

combined.sink { value in
    print("Received: \(value)")
}

publisher1.send(1)
publisher2.send("A")
// Output: Received: (1, "A")

publisher1.send(2)
// Output: Received: (2, "A")

publisher2.send("B")
// Output: Received: (2, "B")
```

In this example, `combineLatest` creates a new publisher that emits a tuple with the most recent values from `publisher1` and `publisher2`.

### 2. `zip` (dùng nén từng cặp giá trị lại với nhau)

The `zip` operator also combines values from two or more publishers, but unlike `combineLatest`, it waits until each publisher has emitted a new value and then emits a tuple containing those values. It essentially pairs up values from each publisher in order.

**Example with Combine:**

```swift
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let zipped = Publishers.Zip(publisher1, publisher2)

zipped.sink { value in
    print("Received: \(value)")
}

publisher1.send(1)
publisher2.send("A")
// Output: Received: (1, "A")

publisher1.send(2)
publisher2.send("B")
// Output: Received: (2, "B")
```

Here, `zip` emits a tuple only when both publishers have emitted new values, pairing them in the order they were emitted.

Note (Nếu send một giá trị thì nó không thể gộp thành cặp  vd publisher1.send(2) thì sẽ ko được nếu không có publisher2.send(B))

### 3. `switchToLatest`

The `switchToLatest` operator is used when dealing with publishers of publishers (i.e., when you have a publisher that itself emits other publishers). It subscribes to the latest publisher emitted by the source publisher and forwards the events from that publisher. If a new publisher is emitted, it switches to that new publisher and unsubscribes from the previous one.

**Example with Combine:**

```swift
import Combine

let subject1 = PassthroughSubject<Int, Never>()
let subject2 = PassthroughSubject<Int, Never>()
let outerSubject = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()

let switched = outerSubject.switchToLatest()

switched.sink { value in
    print("Received: \(value)")
}

outerSubject.send(subject1)
subject1.send(1)
// Output: Received: 1

outerSubject.send(subject2)
subject2.send(2)
// Output: Received: 2

subject1.send(3) // This won't be received because switchToLatest switched to subject2
subject2.send(4)
// Output: Received: 4
```

Note: khi outerSubject.send(subject2) gọi lại subject1.send(3) thì sẽ không phát ra giá trị được vì outersupject đang gọi send subject2

### Summary:

- **`combineLatest`**: Combines the latest values from two or more publishers and emits a tuple whenever any publisher emits a new value.
- **`zip`**: Combines values from two or more publishers into tuples, waiting for each publisher to emit a new value before emitting a new tuple.
- **`switchToLatest`**: Switches to the most recent publisher emitted by a parent publisher, forwarding only the latest publisher's events.