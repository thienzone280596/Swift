# Combine Publisher

# Harnessing the power of publishers

Combine provides us with a few ready-to-use publishers, as mentioned above, there are more, but to keep this short and sweet let’s go over the most frequently used ones:

- **CurrentValueSubject**
- **PassthroughSubject**
- **Just**

## Using a publisher

Let’s focus on the publishers that you and everyone else will be using the most:

### CurrentValueSubject

This publisher emits **AND** stores the current value of a property. Meaning that when a new value is assigned it will be sent to all the subscribers as expected, but, it will also be stored so it can be requested later on for immediate use or requested by new subscribers attached after the value was emitted.

```swift
import Combine

/*
* Let's create a new instance.
* You might notice that publishers need to define Result types
* One for Success, which in our case is Int
* and one for Failure, which should represent an Error type but
* for the purposes of our example we will just say errors Never happen.
*/
let subject = CurrentValueSubject<Int, Never>(0)

// We can consult the value stored right away
print("\(subject.value)") // "0"

// We can subscribe using `sink` and that will also be called right away
// and also when a new value is emitted.
let cancellable = subject.sink { newValue in
   print("\(newValue)") // "0" the first time
}

// Let's update the value
subject.send(10)

print("\(subject.value)") // "10"

// Sink will also print "10"
```

### PassthroughSubject

This publisher is initialised with no initial value and can emit multiple values over time but won’t store any of them for future references. The subscriber is attached to the publisher and it will receive all values sent to the publisher using the `send(_:)` method. However, if a subscriber attaches after a value has been emitted, they won’t be notified. Let’s see this in code:

```swift
import Combine

/*
 * Again, we are defining a new publisher with no error type
 * to keep the examples as simple as possible.
 * As you can see, this Publisher doesn't get an initial value
 */
let subject = PassthroughSubject<Int, Never>() 

/*
 * It sends this value to any subscriber,
 * but because at this point in time it has none,
 * no one will ever know this happened.
 */
subject.send(0) 

/*
 * Now we listen for new values
 * But in contrast to CurrentValueSubject nothing will happen
 * at the time of subscribing because there's no value present
 */
let cancellable = subject.sink { newValue in
    print("\(newValue)") 
}

subject.send(10) // print appears in console "10"
```

