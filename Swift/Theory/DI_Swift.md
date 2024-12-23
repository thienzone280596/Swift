## Dependency Injection

#### Dependency Injection (DI) là gì?
Dependency Injection (DI) là một kỹ thuật thiết kế phần mềm mà ở đó các đối tượng nhận các dependencies của chúng (các đối tượng mà chúng phụ thuộc vào) từ bên ngoài thay vì tạo chúng bên trong. 

```Swift
protocol Service {
    func doSomething()
}

class RealService: Service {
    func doSomething() {
        print("Doing something...")
    }
}

class Client {
    let service: Service

    init(service: Service) {
        self.service = service
    }

    func start() {
        service.doSomething()
    }
}

let realService = RealService()
let client = Client(service: realService)
client.start()
```
Trong ví dụ trên, ***Client*** phụ thuộc vào một đối tượng tuân thủ protocol ***Service***. Thay vì Client tạo ra một instance của ***RealService*** (hoặc bất kỳ lớp nào khác tuân thủ Service), chúng ta chuyển một instance của Service vào Client thông qua hàm khởi tạo. Điều này cho phép chúng ta thay đổi đối tượng Service mà Client sử dụng mà không cần thay đổi code của Client, giúp tăng tính linh hoạt và dễ kiểm tra của code.
#### Dependency Injection Patterns
Có một số mẫu thiết kế (patterns) phổ biến được sử dụng để áp dụng Dependency Injection:

***Constructor Injection:*** Đây là mẫu thiết kế Dependency Injection phổ biến nhất. Trong mẫu này, dependencies được chuyển vào qua hàm khởi tạo (constructor) của lớp. Điều này đảm bảo rằng tất cả các dependencies đều được cung cấp trước khi đối tượng được sử dụng.
***Property Injection:*** Trong mẫu này, dependencies được gán vào các thuộc tính (property) của lớp. Điều này thường được sử dụng khi không thể sử dụng Constructor Injection. Ví dụ khi sử dụng Storyboards trong iOS.
***Method Injection:*** Trong mẫu này, dependencies được chuyển vào qua các phương thức (method) của lớp. Điều này hữu ích khi chỉ một số phương thức cần sử dụng dependency. Hoặc khi dependency có thể thay đổi sau mỗi lần gọi phương thức.
***Ambient Context:*** Đây là một mẫu thiết kế cho phép bạn đặt một “context” mà tất cả các đối tượng trong ứng dụng của bạn có thể truy cập. Điều này có thể hữu ích khi bạn có một số dependencies mà hầu hết các phần của ứng dụng của bạn cần truy cập.
***Service Locator:*** Đây là một mẫu thiết kế cho phép bạn tìm kiếm các dịch vụ (services) mà bạn cần, thay vì chúng được chuyển vào qua hàm khởi tạo hoặc thuộc tính. Tuy nhiên, mẫu này có thể làm cho việc kiểm soát dependencies trở nên khó khăn hơn, vì vậy nó nên được sử dụng một cách cẩn thận.

#### Constructor Injection
**Khái niệm**
Đây là phương pháp phổ biến nhất. Dependency được chuyển vào qua hàm khởi tạo (constructor) của class & struct.
```Swift
class SomeClass {
    let dependency: SomeDependency
    init(dependency: SomeDependency) {
        self.dependency = dependency
    }
}
```
**Ưu điểm:**
* Rõ ràng và dễ hiểu.
* Đảm bảo rằng đối tượng luôn có sẵn các dependencies cần thiết để hoạt động.
* Điều này giúp tránh lỗi runtime do thiếu dependencies.

**Nhược điểm:**
* Nếu một lớp có quá nhiều dependencies, hàm khởi tạo có thể trở nên phức tạp và khó đọc.
* Điều này cũng có thể là dấu hiệu của mùi mã (code smell) – quá nhiều trách nhiệm trong một lớp.
  
#### Áp dụng
Đây là phương pháp nên được sử dụng trong hầu hết các trường hợp. Nó đảm bảo rằng tất cả các dependencies đều được cung cấp trước khi đối tượng được sử dụng. Ví dụ, nếu bạn có một lớp DatabaseManager mà cần một DatabaseConnection để hoạt động, bạn nên chuyển DatabaseConnection vào qua hàm khởi tạo của DatabaseManager.

```Swift
// Define a protocol that represents what actions a printer can do
protocol Printer {
    func printDocument(_ document: String)
}

// Implement a concrete class that conforms to the Printer protocol
class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

// SomeClass depends on a Printer to do its work
class SomeClass {
    let printer: Printer

    init(printer: Printer) {
        self.printer = printer
    }

    func performTask() {
        printer.printDocument("Hello, world!")
    }
}

// Usage
let printer = InkjetPrinter()
let someObject = SomeClass(printer: printer)
someObject.performTask()  // Outputs: Printing document with InkjetPrinter: Hello, world!

```
Trong ví dụ trên, ***SomeClass*** phụ thuộc vào một đối tượng tuân thủ protocol Printer. Thay vì SomeClass tạo ra một instance của InkjetPrinter (hoặc bất kỳ lớp nào khác tuân thủ Printer). Chúng ta chuyển một instance của Printer vào SomeClass thông qua hàm khởi tạo. Điều này cho phép chúng ta thay đổi đối tượng Printer mà SomeClass sử dụng mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.

#### Property (setter) Injection
##### Khái niệm
Dependency được gán vào một thuộc tính công khai. Điều này thường được sử dụng khi không thể sử dụng constructor injection (ví dụ, khi sử dụng Storyboards).
```Swift
class SomeClass {
    var dependency: SomeDependency?

    func doSomething() {
        dependency?.performAction()
    }
}
```
##### Ưu điểm:
* Đơn giản để sử dụng
* Đặc biệt khi không thể sử dụng constructor injection (ví dụ, khi sử dụng Storyboards).
##### Nhược điểm:
* Không đảm bảo rằng dependency sẽ có sẵn khi cần.
* Điều này có thể dẫn đến lỗi runtime nếu bạn quên cung cấp dependency trước khi sử dụng nó.
##### Áp dụng
Phương pháp này thường được sử dụng khi bạn không thể sử dụng constructor injection, ví dụ khi sử dụng Storyboards trong iOS. Trong trường hợp này, bạn không thể chuyển dependencies vào qua hàm khởi tạo của View Controller, vì vậy bạn phải gán chúng vào một thuộc tính sau khi View Controller được khởi tạo.

Ví dụ code khác:
```Swift
// Define a protocol that represents what actions a printer can do
protocol Printer {
    func printDocument(_ document: String)
}

// Implement a concrete class that conforms to the Printer protocol
class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

// SomeClass depends on a Printer to do its work
class SomeClass {
    var printer: Printer?

    func performTask() {
        printer?.printDocument("Hello, world!")
    }
}

// Usage
let someObject = SomeClass()
someObject.printer = InkjetPrinter()
someObject.performTask()  // Outputs: Printing document with InkjetPrinter: Hello, world!
```
Trong ví dụ trên,

SomeClass phụ thuộc vào một đối tượng tuân thủ protocol Printer.
Thay vì SomeClass tạo ra một instance của InkjetPrinter (hoặc bất kỳ lớp nào khác tuân thủ Printer), chúng ta gán một instance của Printer vào SomeClass thông qua thuộc tính printer.
Điều này cho phép chúng ta thay đổi đối tượng Printer mà SomeClass sử dụng, mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.
#### Method (interface) Injection
##### Khái niệm
Dependency được chuyển vào qua một phương thức. Điều này hữu ích khi chỉ một số phương thức cần sử dụng dependency, hoặc khi dependency có thể thay đổi sau mỗi lần gọi phương thức.
```Swift
class SomeClass {
    func performAction(with dependency: SomeDependency) {
        dependency.performAction()
    }
}
```
##### Ưu điểm:
* Linh hoạt, cho phép bạn cung cấp một dependency chỉ khi cần thiết.
* Điều này hữu ích khi dependency có thể thay đổi sau mỗi lần gọi phương thức.
##### Nhược điểm:
* Có thể gây rối rắm nếu có quá nhiều phương thức cần cùng một dependency.
* Trong trường hợp đó, việc sử dụng constructor hoặc property injection có thể tốt hơn.

