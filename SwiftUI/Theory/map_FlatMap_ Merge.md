# Map, FlatMap, Merge

### 1. `map`

The `map` function transforms each element of a collection (like an array) or an optional by applying a given closure to it. It returns a new collection or optional with the transformed elements.

**Example with an Array:**

```swift
let numbers = [1, 2, 3, 4]
let doubled = numbers.map { $0 * 2 }
// doubled = [2, 4, 6, 8]
```

Example with an Optional:

```swift
let number: Int? = 5
let result = number.map { $0 * 2 }
// result = 10 (Optional(10))
```

### 2. `flatMap`

The `flatMap` function is used to transform elements and flatten the resulting structure if it contains nested optionals or collections. It's often used when you want to avoid nesting or when working with optionals that might be nil.

**Example with an Array:**

```swift
let numbers = [1, 2, 3, 4]
let expanded = numbers.flatMap { [$0, $0] }
// expanded = [1, 1, 2, 2, 3, 3, 4, 4]
```

Example with Optionals:

```swift
let number: Int? = 5
let result = number.flatMap { Optional($0 * 2) }
// result = 10 (Optional(10))
```

`flatMap` is particularly useful in avoiding nested optionals:

```swift
let optionalNumber: Int?? = 5
let result = optionalNumber.flatMap { $0 }
// result = 5 (Optional(5))

```

### 3. `merge`

In Swift, `merge` isn't a built-in function like `map` or `flatMap`, but the concept of merging is relevant when combining collections or publishers in Combine.

**Example with Combine (Merging Publishers):**

```swift
import Combine

let publisher1 = [1, 2, 3].publisher
let publisher2 = [4, 5, 6].publisher

let merged = Publishers.Merge(publisher1, publisher2)
merged.sink { value in
    print(value)
}
// Output: 1, 2, 3, 4, 5, 6
```

In this case, `merge` is used to combine two or more publishers into one, where the elements of each publisher are emitted as they arrive.

### Summary:

- **`map`**: Transforms elements of a collection or optional.
- **`flatMap`**: Transforms and flattens nested structures.
- **`merge`**: Combines multiple collections or publishers into one.

These functions are very powerful and are widely used in Swift for handling data transformations and managing asynchronous workflows.