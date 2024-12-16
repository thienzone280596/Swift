## Automatic Reference Counting (ARC)
Automatic Reference Counting (ARC) is a memory management mechanism in Apple's Swift programming language. ARC automatically frees the memory occupied by an object when there are no more references to that object. This helps reduce the risk of memory errors such as memory leaks and dangling pointers.

> A strong reference is a reference that does not allow the object to be released as long as the reference exists.

#### 1. What about Non-ARC?
In Objective-C, you can choose not to use ARC (non-ARC). And instead manage memory manually using keywords like retain, release, and autorelease. However, this is not possible in Swift.

#### 2. Swift with Objective C

ARC in Swift and Objective-C work on the same basic principle. Track the number of references to an object. And release the object’s memory when there are no more references. However, there are some important differences:

Clarity: In Swift, ARC works automatically and does not require any intervention from the programmer. Whereas, in Objective-C, the programmer needs to use keywords like retain, release, and autorelease to manage memory.
Weak and unowned references: Swift provides two other types of references, “weak references” and “unowned references” to solve the problem of strong circular references. In Objective-C, there are only weak references.
Closures: Swift provides capture lists in closures. To solve the problem of strong circular references between objects and closures. Objective-C does not have a similar mechanism.
Optional and Unwrapping: Swift has optional and unwrapping mechanisms to handle the case where a weak reference can become nil. In Objective-C, a weak reference becoming nil can cause a runtime error. ARC is default: In Swift, ARC is enabled by default for all objects. In Objective-C, ARC is not always enabled and the programmer needs to enable it.
#### 3. How ARC works
ARC works by keeping track of the number of strong references to an object.

Whenever you create a new strong reference to an object, ARC increases the reference count of that object.
When a strong reference to an object is released, ARC decreases the reference count of that object.
When the reference count of an object reaches 0, it means that there are no more strong references to that object. ARC frees the memory that the object is occupying.
```Swift
class MyClass {
    var name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: MyClass? = MyClass(name: "My Class Instance")
var reference2 = reference1
var reference3 = reference1
reference1 = nil
reference2 = nil
```
#### 4. Strong References
In the context of ARC in Swift, a Strong Reference is a reference to an object that does not allow that object to be released by the automatic memory management (ARC) system as long as the strong reference exists.

However, strong references can lead to retain cycle problems, where two or more objects reference each other without releasing, leading to memory leaks.
```Swift
//using unowed reslove retain cycle
class Employee {
    let name: String
    var department: Department?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Department {
    let name: String
    unowned var manager: Employee
    init(name: String, manager: Employee) {
        self.name = name
        self.manager = manager
    }
    deinit {
        print("Department \(name) is being deinitialized")
    }
}
var john: Employee? = Employee(name: "John Doe")
var engineering: Department? = Department(name: "Engineering", manager: john!)
john?.department = engineering
john = nil
engineering = nil
```
#### 5. Weak References
A Weak Reference is a type of reference that does not increase the reference count of an object. This means that:
>“It does not prevent ARC from releasing the object it references when that object no longer has any other strong references.”

```Swift
class Person {
    let name: String
    weak var friend: Person?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var alice: Person? = Person(name: "Alice")
var bob: Person? = Person(name: "Bob")
alice?.friend = bob
bob?.friend = alice
alice = nil
bob = nil
```
#### 6. Unowned References
A non-owning reference does not increase the reference count of an object. However, unlike a weak reference,

* a non-owning reference is not optional.

* it does not automatically become nil when the object it references is deallocated.

Therefore, you should only use a non-owning reference when you are sure that the object it references will always exist as long as the non-owning reference exists.

```Swift
class Customer {
    let name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: Int64
    unowned let customer: Customer

    init(number: Int64, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var john: Customer? = Customer(name: "John Appleseed")
john?.card = CreditCard(number: 1234567890123456, customer: john!)

john = nil
```
#### 7. Strong Reference Cycles (Retain Cycles)
“Strong Reference Cycles” or “Retain Cycles” in Swift is a situation where two or more objects reference each other through strong references, creating a reference chain that never releases.
```Swift
//Example Strong Retain Cycles
class ClassA {
    var b: ClassB?
    deinit {
        print("ClassA is being deinitialized")
    }
}
class ClassB {
    var a: ClassA?
    deinit {
        print("ClassB is being deinitialized")
    }
}
var instanceA: ClassA? = ClassA()
var instanceB: ClassB? = ClassB()
instanceA?.b = instanceB
instanceB?.a = instanceA
instanceA = nil
instanceB = nil
```
#### 8. Strong Reference Cycles Between Class Instances and Closures
Occurs when a closure holds a strong reference to an object. And that object also holds a strong reference to that closure…

```SWift
class MyClass {
    var value = 0
    lazy var closure: () -> () = {
        self.value += 1
    }
    deinit {
        print("MyClass instance is being deinitialized")
    }
}
var instance: MyClass? = MyClass()
instance?.closure()
instance = nil
```
Trong ví dụ trên,

closure nắm giữ một tham chiếu mạnh đến self (đối tượng MyClass).
* Vì nó truy cập vào thuộc tính **value** của **self**.
* Đồng thời, self cũng nắm giữ một tham chiếu mạnh đến **closure**, vì **closure** là một thuộc tính của self.
```Swift
class MyClass {
    var value = 0
    lazy var closure: () -> () = { [weak self] in
        self?.value += 1
    }
    deinit {
        print("MyClass instance is being deinitialized")
    }
}
var instance: MyClass? = MyClass()
instance?.closure()
instance = nil
```