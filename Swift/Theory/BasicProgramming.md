### 1. Hướng đối tượng có bao nhiêu tính chất? Các tính chất đó là gì?

Lập trình hướng đối tượng (OOP) có bốn tính chất chính:

**Đóng gói (Encapsulation)**:

- Đóng gói là việc gói gọn dữ liệu (các thuộc tính) và các phương thức thao tác trên dữ liệu đó vào trong một đối tượng. Điều này giúp bảo vệ dữ liệu khỏi sự can thiệp và sử dụng không hợp lệ từ bên ngoài. Các thuộc tính thường được khai báo là `private` hoặc `protected` và chỉ có thể truy cập thông qua các phương thức công khai (public methods).

**Kế thừa (Inheritance)**:

- Kế thừa cho phép một lớp con (subclass) kế thừa các thuộc tính và phương thức từ một lớp cha (superclass). Điều này giúp tái sử dụng mã nguồn, giảm thiểu sự trùng lặp và cải thiện tính bảo trì của hệ thống. Lớp con có thể mở rộng hoặc ghi đè các phương thức của lớp cha.

**Đa hình (Polymorphism)**:

- Đa hình cho phép một phương thức có thể có nhiều cách thực thi khác nhau dựa trên đối tượng gọi nó. Điều này có thể thực hiện thông qua cơ chế ghi đè phương thức (method overriding) hoặc nạp chồng phương thức (method overloading). Đa hình giúp mã nguồn linh hoạt và dễ mở rộng.

**Trừu tượng hóa (Abstraction)**:

- Trừu tượng hóa là việc ẩn đi các chi tiết thực thi cụ thể và chỉ hiển thị các đặc điểm cần thiết của đối tượng. Nó giúp giảm thiểu sự phức tạp và tăng tính tập trung vào việc xử lý logic chính của chương trình. Trừu tượng hóa thường được thực hiện bằng cách sử dụng các lớp trừu tượng (abstract classes) và giao diện (interfaces).

### 2. Kế thừa trong Switf là đơn hay đa thừa kế? Muốn đa thừa kế thì phải như thế nào?

Trong Swift, kế thừa là đơn kế thừa, có nghĩa là một lớp (class) chỉ có thể kế thừa từ một lớp cha (superclass) duy nhất. Tuy nhiên, Swift hỗ trợ một số cách khác để đạt được tính năng tương tự như đa thừa kế thông qua việc sử dụng protocol và extension.

**Sử dụng Protocols**

Protocol trong Swift là một cách để định nghĩa các phương thức, thuộc tính mà một class hoặc struct cần tuân theo. Một lớp có thể tuân theo nhiều protocol, điều này cho phép bạn có thể tạo ra các tính năng tương tự như đa thừa kế.

**Sử dụng Extensions**

Extensions cho phép bạn thêm các tính năng mới cho các lớp hiện có, struct, enum hoặc protocol. Bạn có thể sử dụng extension để thêm phương thức hoặc thuộc tính mới vào các kiểu dữ liệu hiện có.

### 3. Hướng đối tượng trong Swift có tính trừu tượng hay không?

Trong Swift, lập trình hướng đối tượng (OOP) có tính trừu tượng. Trừu tượng trong lập trình hướng đối tượng cho phép bạn định nghĩa các lớp, phương thức và thuộc tính một cách chung chung mà không cần phải cụ thể hóa các chi tiết triển khai. Swift hỗ trợ tính trừu tượng thông qua việc sử dụng lớp trừu tượng (abstract class) và giao thức (protocol).

**Lớp Trừu Tượng (Abstract Class)**

Swift không có khái niệm lớp trừu tượng một cách chính thức như một số ngôn ngữ khác (như Java), nhưng bạn có thể tạo ra lớp trừu tượng bằng cách sử dụng lớp cơ sở (base class) có các phương thức hoặc thuộc tính mà các lớp con phải triển khai.

**Giao Thức (Protocol)**

Protocols trong Swift là cách chủ yếu để thực hiện tính trừu tượng. Giao thức định nghĩa một bộ các phương thức và thuộc tính mà một lớp hoặc struct cần tuân theo mà không cung cấp triển khai cụ thể.

### 4. Class & struct khác nhau như thế nào?

Trong Swift, lớp (class) và cấu trúc (struct) là hai loại kiểu dữ liệu phổ biến được sử dụng để tạo ra các đối tượng và mô hình hóa dữ liệu. Dưới đây là những điểm khác nhau chính giữa chúng:

**Tham Chiếu và Giá Trị**

- **Class (Lớp)**: Là kiểu tham chiếu (reference type). Khi bạn gán một biến của kiểu class cho một biến khác, cả hai biến sẽ tham chiếu đến cùng một đối tượng. Thay đổi giá trị của đối tượng thông qua một biến sẽ ảnh hưởng đến biến còn lại.
- **Struct (Cấu trúc)**: Là kiểu giá trị (value type). Khi bạn gán một biến của kiểu struct cho một biến khác, một bản sao của dữ liệu sẽ được tạo ra. Thay đổi giá trị của biến này sẽ không ảnh hưởng đến biến còn lại.

**Kế Thừa**

- **Class (Lớp)**: Hỗ trợ kế thừa. Một lớp có thể kế thừa từ một lớp khác, giúp bạn tạo ra các cấu trúc phân cấp.
- **Struct (Cấu trúc)**: Không hỗ trợ kế thừa. Struct không thể kế thừa từ struct khác hoặc từ class.

**Khởi Tạo và Giải Phóng**

- **Class (Lớp)**: Có thể có deinit để thực hiện một số công việc khi đối tượng bị giải phóng khỏi bộ nhớ.
- **Struct (Cấu trúc)**: Không có deinit.

**Tính Đồng Nhất**

- **Class (Lớp)**: Cho phép bạn so sánh hai biến để kiểm tra xem chúng có tham chiếu đến cùng một đối tượng hay không bằng cách sử dụng toán tử ===.
- **Struct (Cấu trúc)**: Không hỗ trợ ===. Bạn chỉ có thể so sánh giá trị của các thuộc tính bên trong struct.

 **Khả Năng Mutability (Thay Đổi)**

- **Class (Lớp)**: Có thể thay đổi các thuộc tính bất kể biến là let hay var.
- **Struct (Cấu trúc)**: Chỉ có thể thay đổi các thuộc tính nếu biến struct được khai báo là var. Nếu struct được khai báo là let, mọi thuộc tính bên trong cũng sẽ là không thay đổi.

 **Sao Chép và Hiệu Suất**

- **Class (Lớp)**: Do là kiểu tham chiếu nên việc sao chép một đối tượng class chỉ tạo ra một tham chiếu mới đến cùng một vùng nhớ. Điều này có thể hiệu quả hơn về bộ nhớ nhưng đòi hỏi quản lý bộ nhớ phức tạp hơn.
- **Struct (Cấu trúc)**: Do là kiểu giá trị nên việc sao chép một struct tạo ra một bản sao hoàn toàn mới. Điều này đơn giản hơn về quản lý bộ nhớ nhưng có thể tốn kém hơn về bộ nhớ và hiệu suất khi làm việc với các struct lớn.

### 5. Có bao nhiêu mức Access Control trong Swift? Hãy liệt kê chúng theo thứ tự giảm dần?

Trong Swift, có năm mức độ kiểm soát truy cập (Access Control) chính. Dưới đây là danh sách các mức độ này theo thứ tự giảm dần về mức độ truy cập:

1. **Open**
2. **Public**
3. **Internal**
4. **Fileprivate**
5. **Private**

### Chi tiết các mức Access Control

**Open**

- `open` là mức truy cập cao nhất.
- Các thành phần khai báo với `open` có thể được truy cập và kế thừa từ bất cứ nơi nào trong module của chúng và trong các module khác.
- Chỉ có lớp và phương thức khai báo với `open` mới có thể được ghi đè (override) hoặc kế thừa từ ngoài module.

**Public**

- `public` cho phép truy cập đến các thành phần từ bất cứ nơi nào nhưng chỉ có thể được kế thừa và ghi đè trong cùng module.
- Đây là mức truy cập cao nhất cho struct và enum.

**Internal**

- `internal` là mức truy cập mặc định.
- Các thành phần khai báo với `internal` chỉ có thể được truy cập trong cùng một module.
- Điều này hữu ích khi bạn muốn chia sẻ code giữa các phần khác nhau trong ứng dụng nhưng không muốn nó được truy cập từ ngoài module.

**Fileprivate**

- `fileprivate` giới hạn truy cập trong cùng một file nguồn.
- Các thành phần khai báo với `fileprivate` chỉ có thể được truy cập bởi các đoạn mã trong cùng file nguồn đó.
- Điều này hữu ích khi bạn muốn che giấu các chi tiết triển khai nhưng vẫn cần chia sẻ chúng giữa nhiều phần trong cùng một file.

**Private**

- `private` là mức truy cập thấp nhất.
- Các thành phần khai báo với `private` chỉ có thể được truy cập trong phạm vi của khai báo chúng.
- Điều này giúp bạn bảo vệ các chi tiết triển khai cụ thể của một lớp hoặc struct, không cho phép truy cập từ bên ngoài.

Quản lý bộ nhớ trong iOS chủ yếu được thực hiện thông qua hệ thống Automatic Reference Counting (ARC) của Swift. ARC tự động theo dõi và quản lý bộ nhớ của các đối tượng trong ứng dụng của bạn, giúp bạn tránh các lỗi quản lý bộ nhớ phổ biến như rò rỉ bộ nhớ (memory leaks) và sử dụng bộ nhớ không hợp lệ (dangling pointers). Dưới đây là một số khái niệm và cơ chế chính liên quan đến quản lý bộ nhớ trong iOS:

### 6. Quản lý bộ nhớ trong iOS như thế nào?

**Automatic Reference Counting (ARC)**

ARC tự động thêm và loại bỏ các tham chiếu đến các đối tượng của bạn. Khi không còn bất kỳ tham chiếu nào đến một đối tượng, bộ nhớ dành cho đối tượng đó sẽ được giải phóng.

- **Strong References**: Mặc định, các tham chiếu đến các đối tượng là mạnh (strong). Khi bạn gán một đối tượng cho một biến, thuộc tính, hoặc một collection, một tham chiếu mạnh được tạo ra. Đối tượng sẽ không được giải phóng cho đến khi tất cả các tham chiếu mạnh đến nó được giải phóng.
- **Weak References**: Một tham chiếu yếu (weak) không giữ mạnh mẽ đối tượng mà nó tham chiếu đến, cho phép đối tượng đó được giải phóng nếu không còn bất kỳ tham chiếu mạnh nào đến nó. Tham chiếu yếu hữu ích để tránh các chu kỳ tham chiếu (retain cycles).
- **Unowned References**: Tương tự như tham chiếu yếu, nhưng được sử dụng khi bạn biết rằng tham chiếu sẽ không bao giờ là nil sau khi được thiết lập lần đầu. Nếu bạn cố gắng truy cập một tham chiếu không sở hữu (unowned) sau khi đối tượng đã được giải phóng, ứng dụng của bạn sẽ gặp sự cố.

**Retain Cycles**

Một chu kỳ tham chiếu xảy ra khi hai hoặc nhiều đối tượng giữ tham chiếu mạnh đến nhau, ngăn cản chúng được giải phóng. ARC không thể tự động phá vỡ chu kỳ tham chiếu này, dẫn đến rò rỉ bộ nhớ.

**Giải Quyết Retain Cycles**

Bạn có thể sử dụng các tham chiếu yếu (`weak`) và không sở hữu (`unowned`) để giải quyết các chu kỳ tham chiếu.

**Memory Management Best Practices**

- Sử dụng các tham chiếu yếu (`weak`) và không sở hữu (`unowned`) khi cần thiết để tránh chu kỳ tham chiếu.
- Sử dụng `Capture Lists` trong các closures để kiểm soát cách các biến được lưu trữ trong closure và tránh chu kỳ tham chiếu.
- Dọn dẹp và giải phóng các tài nguyên không cần thiết đúng lúc để tối ưu hóa bộ nhớ.

### 7. Property Wrappers trong Swift là gì? Liệt kê các loại Wrapper bạn hay sử dụng?

Property Wrappers trong Swift là một tính năng mạnh mẽ cho phép bạn thêm hành vi tùy chỉnh vào các thuộc tính (property) của các lớp và struct một cách dễ dàng và có thể tái sử dụng. Property Wrappers cho phép bạn gói gọn (encapsulate) logic xử lý lặp đi lặp lại liên quan đến việc quản lý và thay đổi các thuộc tính.

**@State** (SwiftUI):

- Được sử dụng trong SwiftUI để quản lý trạng thái nội bộ của một view.

**@Binding** (SwiftUI):

- Được sử dụng để tạo một liên kết (binding) hai chiều giữa một view và một nguồn dữ liệu bên ngoài.

**@ObservedObject** (SwiftUI):

- Được sử dụng trong SwiftUI để theo dõi một đối tượng ObservableObject và cập nhật view khi đối tượng thay đổi.

**@EnvironmentObject** (SwiftUI):

- Được sử dụng trong SwiftUI để chia sẻ dữ liệu giữa nhiều view.

**@AppStorage** (SwiftUI):

- Được sử dụng để lưu trữ và đọc các giá trị từ UserDefaults.

### 8. Phân biệt Strong và Weak

**Strong**

1. **Mô tả**:
   - Tham chiếu `strong` giữ đối tượng được tham chiếu sống (alive) miễn là tham chiếu còn tồn tại.
   - Đây là loại tham chiếu mặc định trong Swift nếu không được chỉ định khác.
2. **Quy tắc**:
   - Khi một đối tượng có một thuộc tính với tham chiếu `strong` đến một đối tượng khác, đối tượng đó sẽ không bị giải phóng khỏi bộ nhớ cho đến khi tất cả các tham chiếu `strong` đến nó bị hủy.

**Weak**

1. **Mô tả**:
   - Tham chiếu `weak` không giữ đối tượng được tham chiếu sống. Nếu tất cả các tham chiếu mạnh (strong) đến đối tượng bị hủy, đối tượng sẽ được giải phóng khỏi bộ nhớ ngay cả khi vẫn còn tham chiếu `weak` đến nó.
   - Được sử dụng để tránh chu kỳ tham chiếu mạnh.
2. **Quy tắc**:
   - Thuộc tính `weak` luôn là `optional` (`nil` mặc định) bởi vì nó có thể tự động được đặt về `nil` khi đối tượng mà nó tham chiếu bị giải phóng khỏi bộ nhớ.

### 9. Trình bày iOS Application Lifecycle?

Một application sẽ có các trạng thái như sau: 
– **Not running**: Là trạng thái application chưa được bắt đầu hoặc đã chạy nhưng bị terminated bởi system. 
– **Inactive**: Application đang chạy ở Foreground nhưng không nhận bất cứ sự kiện tương tác nào và cũng không thể xử lý các sự kiện (có thể là bị một vài sự kiện tác động vào trong quá trình chạy, ví dụ như có cuộc gọi đến hay tin nhắn chẳng hạn). 1 app cũng có thể ở trong trạng thái này khi chuyển từ state này sang state khác. 
– **Active**: Application đang chạy ở Foreground và đang nhận các sự kiện bình thường. Cách duy nhất để đến trạng thái Active là thông qua Inactive. Ở trạng thái này, khi người dùng tương tác với UI, họ có thể nhìn thấy phản hồi cho những hành động của họ.
– **Background**: Application đang chạy ở background và đang thực thi code. Ở trạng thái này UI của app không được hiển thị nhưng mà nó lại vẫn đang chạy (nếu có đăng ký background task với OS). Hầu hết các app chuyển trạng thái sang suspended thông qua trạng thái này.
– **Suspended**: Application đang chạy ở background nhưng không thể thực thi code. Thường thì sẽ do chính system sẽ tự động đưa app về trạng thái này và lúc đó app vẫn đang trong memory. Trong trường hợp low memory, hệ thống có thể sẽ tự kill app của mình khi app đang ở trạng thái suspended mà không thông báo gì. 

Về cơ bản thì 1 application có các trạng thái như trên, và trong app chúng ta cũng có các event tương ứng để được notify khi bắt đầu hay đã vào các trạng thái trên. Các hàm đó được list trong AppDelegate. Các trạng thái chuyển đổi qua lại được gọi là transition giữa các trạng thái.
– **application:willFinishLaunchingWithOptions ——**  Method này được gọi sau khi app của chúng ta khởi chạy thành công. Nó là method đầu tiên được chạy từ app delegate. Chúng ta có thể thực thi các đoạn code nếu khởi chạy thành công.
– **application:didFinishLaunchingWithOptions   ——**  Method này được gọi trước khi window của app được hiển thị. Bạn có thể hoàn thiện giao diện của mình và cung cấp root viewcontroller cho window.
– **applicationDidBecomeActive ——**  Method này được gọi để báo cho app của bạn biết khi nó chuyển trạng thái từ In-Active sang Active hoặc hệ thống và user khơi động app hoặc trong trường hợp user bỏ quan các gián đoạn làm app ngay lập tức chuyển sang In-Active (như là có cuộc gọi đến hoặc tin nhắn). Bạn nên dùng method này để chạy lại các tác vụ đang bị dừng (hoặc chưa chạy) khi app bắt đầu chạy lại.
– **applicationWillResignActive ——**  Method này được gọi để báo cho app biết rằng nó sắp chuyển từ trạng thái Active sang In-Active . Nó xãy ra khi trường hợp bị gián đoạn (có cuộc gọi tới hoặc SMS) hay là khi user tắt app đi. Bạn nên dùng method này để dừng các task đang chạy hoặc vô hiệu hoá timer trong app, hoặc nhiều thứ khác 
– **applicationDidEnterBackground ——**  Method này được gọi để báo cho app biết nó đang không chạy ở dưới foreground. Bạn có khoảng tầm 5 giây để thực thi các task . Trong trường hợp bạn muốn có nhiều thời gian hơn để xử lý, bạn có thể yêu cầu hệ thống cấp cho thời gian thực thi bằng cách gọi hàm [beginBackgroundTask(expirationHandler:)](https://developer.apple.com/documentation/uikit/uiapplication/1623031-beginbackgroundtask) . Nếu như method của bạn không được thực thi và trả về trước thời gian hết hạn thì app sẽ bị hệ thống chấm dứt và xoá khỏi bộ nhớ.
– **applicationWillEnterForeground ——**  Method này được gọi như là 1 phần trong việc chuyển trạng thái từ Background sang Active. Bạn nên dùng method này để hoàn thành các thay đổi đối với app trước khi nó xuống Background. applicationDidBecomeActive sẽ được gọi ngay khi method này đã hoàn thành việc chuyển trạng thái của app từ In-Active sang Active.
– **applicationWillTerminate ——**  Method này được gọi khi app của bạn sắp bị hệ thống khai tử khỏi bộ nhớ. Bạn nên dùng method này để thực thi các tác vụ dọn dẹp. Bạn có tầm khoảng 5 giây để thực thi tác vụ. Nếu hàm của bạn không trả về trước thời gian hết hạn, hệ thống sẽ tự động khai tử app kèm cã task đang thực thi của bạn khỏi bộ nhớ. Method này cũng được gọi trong trường hợp app đang chạy ở dưới background( không bị suspended) nhưng hệ thống lại cần phải huỷ nó vì vài lí do gì đó. Bạn không nên đợi **applicationWillTerminate** được gọi rồi mới lưu lại data. Trong 1 vài trường hợp hi hữu, **applicationWillTerminate** sẽ không được gọi trước khi app bị khai tử (Vd như trong trường hợp máy của bạn reboot lại thì method này sẽ không được gọi).

### 10. Sự khác nhau của AppDelegate & SenceDelegate?

Trong phát triển ứng dụng iOS, `AppDelegate` và `SceneDelegate` là hai thành phần quan trọng, nhưng có vai trò khác nhau trong quản lý vòng đời của ứng dụng. Dưới đây là sự khác biệt giữa chúng:

**AppDelegate**

- **Vai trò chính:** Quản lý vòng đời của ứng dụng.
- Chịu trách nhiệm:
  - Khởi động ứng dụng.
  - Quản lý trạng thái nền và kích hoạt của ứng dụng.
  - Xử lý các sự kiện như nhận thông báo từ xa (push notifications), mở URL từ bên ngoài, và các dịch vụ liên quan đến Apple như WatchKit, HealthKit, v.v.
- Phương thức quan trọng:
  - `application(_:didFinishLaunchingWithOptions:)`
  - `applicationDidEnterBackground(_:)`
  - `applicationWillEnterForeground(_:)`
  - `applicationDidBecomeActive(_:)`
  - `applicationWillTerminate(_:)`

**SceneDelegate**

- **Vai trò chính:** Quản lý vòng đời của một cảnh (scene) trong ứng dụng.
- Chịu trách nhiệm:
  - Quản lý giao diện người dùng của một cảnh cụ thể.
  - Hỗ trợ ứng dụng chạy đa cảnh (multiple scenes), tức là ứng dụng có thể có nhiều cửa sổ hoặc giao diện người dùng hoạt động đồng thời.
- Phương thức quan trọng:
  - `scene(_:willConnectTo:options:)`
  - `sceneDidDisconnect(_:)`
  - `sceneDidBecomeActive(_:)`
  - `sceneWillResignActive(_:)`
  - `sceneWillEnterForeground(_:)`
  - `sceneDidEnterBackground(_:)`

**Sự khác biệt chính**

1. **Phạm vi hoạt động:**
   - `AppDelegate` quản lý toàn bộ ứng dụng.
   - `SceneDelegate` quản lý các cảnh riêng lẻ trong ứng dụng.
   
2. **Hỗ trợ đa cảnh:**
   - `AppDelegate` không quản lý từng cảnh riêng biệt.
   
   - `SceneDelegate` được giới thiệu từ iOS 13 để hỗ trợ tính năng đa cảnh, giúp ứng dụng có thể hiển thị nhiều cửa sổ trên iPad hoặc trên macOS (Catalyst).
   
     10. Sự khác nhau của AppDelegate & SenceDelegate?
   
     Sự khác nhau của AppDelegate & SenceDelegate?

### 11. Trình bày về mô mình MVC & MVVM trong iOS & Swift? 

**1. MVC (Model-View-Controller)**

MVC là mô hình kiến trúc truyền thống và được Apple khuyến nghị sử dụng cho phát triển ứng dụng iOS. MVC chia ứng dụng thành ba thành phần chính: Model, View và Controller.

**a. Các thành phần trong MVC**

​	**Model**:

​	•	Đóng vai trò quản lý dữ liệu của ứng dụng.

​	•	Model chứa các logic liên quan đến dữ liệu, như truy xuất từ cơ sở dữ liệu, xử lý và cập nhật dữ liệu

​	Ví dụ: Các lớp như User, Product, Order chứa các thuộc tính và phương thức để truy xuất dữ liệu.

​	•	**View**:

​	•	Chứa các thành phần giao diện người dùng (UI) như nút bấm, nhãn, bảng, và các giao diện đồ họa khác.

​	•	View không chứa logic liên quan đến dữ liệu mà chỉ hiển thị những gì controller cung cấp.

​	•	Ví dụ: Các thành phần UI như UILabel, UIButton, UITableView.

​	•	**Controller**:

​	•	Là cầu nối giữa Model và View.

​	•	Controller nhận dữ liệu từ Model, xử lý logic liên quan và truyền dữ liệu này cho View để hiển thị.

​	•	Thường là lớp UIViewController, nơi xử lý logic hiển thị, phản hồi sự kiện từ người dùng, và yêu cầu cập nhật dữ liệu từ Model.

**b. Ưu điểm và nhược điểm của MVC**

​	•	**Ưu điểm**:

​	•	Dễ hiểu và triển khai, đặc biệt cho các ứng dụng nhỏ.

​	•	Tích hợp tốt với các thành phần UIKit, đặc biệt là UIViewController.

​	•	**Nhược điểm**:

​	•	Controller có thể trở nên phức tạp (gọi là “Massive View Controller”) khi có quá nhiều logic được xử lý trong đó.

​	•	Việc kiểm thử có thể gặp khó khăn do logic và giao diện thường bị lẫn lộn trong Controller.

​	•	Không tách biệt hoàn toàn giữa logic và giao diện.

​	•	**Model**:

​	•	Giống như trong MVC, Model chứa dữ liệu và logic nghiệp vụ của ứng dụng.

​	•	**View**:

​	•	Chứa giao diện người dùng, giống MVC.

​	•	Trong SwiftUI, View đóng vai trò trực tiếp quản lý trạng thái giao diện dựa trên dữ liệu từ ViewModel.

​	•	**ViewModel**:

​	•	Là thành phần mới trong MVVM giúp tách biệt logic giao diện và dữ liệu.

​	•	ViewModel nhận dữ liệu từ Model và xử lý logic cần thiết trước khi gửi đến View.

​	•	Trong iOS, ViewModel thường sử dụng Combine hoặc ReactiveCocoa để thông báo thay đổi cho View bằng các cơ chế binding hoặc các đối tượng ObservableObject trong SwiftUI.

**b. Ưu điểm và nhược điểm của MVVM**

​	•	**Ưu điểm**:

​	•	Tách biệt rõ ràng giữa logic và giao diện, giúp giảm tải cho ViewController.

​	•	Dễ kiểm thử hơn do ViewModel độc lập với View và không phụ thuộc vào UIKit.

​	•	ViewModel quản lý trạng thái và tương tác với Model, giúp View trở nên “mỏng” hơn, chỉ hiển thị những gì nhận được từ ViewModel.

​	•	**Nhược điểm**:

​	•	Cấu trúc phức tạp hơn, đòi hỏi hiểu biết về binding và lập trình phản ứng.

​	•	Việc quản lý và xử lý binding có thể trở nên phức tạp, nhất là với các dự án lớn.

**c. Ứng dụng MVVM trong iOS**

​	•	Trong UIKit, MVVM thường sử dụng các framework như Combine, RxSwift, hoặc ReactiveCocoa để binding dữ liệu từ ViewModel đến View.

### 12. Khác nhau giữa storyboard và XIB

**Ưu điểm của Storyboard**

​	•	**Tổng quan giao diện**: Cho phép bạn xem và thiết kế luồng giao diện của ứng dụng một cách trực quan, dễ dàng theo dõi toàn bộ ứng dụng và các mối quan hệ giữa các màn hình.

​	•	**Segue và luồng dữ liệu**: Hỗ trợ các segue (điều hướng) trực tiếp giữa các màn hình, giúp kết nối và điều hướng một cách rõ ràng.

​	•	**Tính năng Auto Layout và Preview**: Storyboard hỗ trợ các công cụ Auto Layout và Preview, giúp thiết kế giao diện thích ứng với các kích thước màn hình khác nhau một cách nhanh chóng.

**Nhược điểm của Storyboard**

​	•	**Khó quản lý trong dự án lớn**: Storyboard trở nên phức tạp và khó quản lý khi ứng dụng có quá nhiều màn hình và các chi tiết phức tạp.

​	•	**Xung đột khi làm việc nhóm**: Storyboard là một file XML lớn, do đó khi nhiều người làm việc đồng thời trên cùng một storyboard, dễ xảy ra xung đột trong hệ thống quản lý mã nguồn (như Git).

​	•	**Hiệu suất**: Với các dự án lớn, Storyboard có thể làm chậm quá trình tải giao diện do phải tải toàn bộ file giao diện ngay cả khi chỉ cần một phần nhỏ.

**2. XIB (XML Interface Builder)**

**XIB** (hay còn gọi là Interface Builder file) là một file XML riêng lẻ, được sử dụng để tạo một màn hình hoặc một thành phần giao diện riêng biệt (như UITableViewCell, UIView, hoặc một UIViewController cụ thể).

**Ưu điểm của XIB**

​	•	**Quản lý độc lập từng màn hình**: Mỗi file XIB chỉ chứa một giao diện hoặc một thành phần UI, giúp việc quản lý và duy trì từng phần nhỏ của giao diện trở nên dễ dàng.

​	•	**Giảm xung đột khi làm việc nhóm**: Vì XIB chia nhỏ giao diện thành các file độc lập, các lập trình viên có thể làm việc trên các màn hình khác nhau mà ít xảy ra xung đột mã nguồn.

​	•	**Tải nhanh hơn**: XIB chỉ tải giao diện khi cần, giúp cải thiện hiệu suất ứng dụng so với việc tải toàn bộ giao diện như trong Storyboard.

**Nhược điểm của XIB**

​	•	**Không hỗ trợ segue và luồng giao diện**: XIB chỉ là file giao diện độc lập nên không hỗ trợ các segue giữa các màn hình, điều này đòi hỏi việc điều hướng phải được thực hiện bằng code.

​	•	**Khó quản lý tổng thể giao diện**: Vì không có cái nhìn tổng quan về luồng giao diện, quản lý luồng chuyển giữa các màn hình khi dùng XIB có thể phức tạp, nhất là với các ứng dụng lớn.

​	•	**Thiếu Preview tổng quan**: Mặc dù XIB có hỗ trợ Preview, nhưng không có cái nhìn tổng quan để thấy toàn bộ luồng giao diện của ứng dụng.

**Khi nào nên dùng XIB?**

​	•	Khi bạn cần tách biệt từng màn hình hoặc từng thành phần UI để dễ dàng bảo trì và phát triển.

​	•	Khi phát triển một ứng dụng lớn, nơi mà bạn cần nhiều lập trình viên làm việc đồng thời trên giao diện mà không ảnh hưởng đến nhau.

​	•	Khi cần tái sử dụng một phần giao diện nhiều lần trong ứng dụng.

### 13. Thế nào là singleton? Có bao nhiều cách tạo một singleton?

**Singleton** là một mẫu thiết kế **Creational Design Pattern** trong lập trình phần mềm, đảm bảo rằng một lớp chỉ có một instance duy nhất trong suốt vòng đời của ứng dụng. Mẫu Singleton cung cấp một phương thức toàn cục để truy cập vào đối tượng duy nhất này. Mẫu này thường được sử dụng trong các tình huống khi chỉ cần một đối tượng toàn cục duy nhất để quản lý tài nguyên hoặc trạng thái chung (ví dụ: quản lý kết nối cơ sở dữ liệu, cấu hình ứng dụng, hoặc các tài nguyên chia sẻ khác).

**Các cách tạo Singleton trong Swift**

Trong Swift, có nhiều cách để triển khai mẫu Singleton. Dưới đây là một số phương pháp phổ biến:

**1. Cách 1: Sử dụng static constant**

Đây là cách triển khai Singleton đơn giản và phổ biến nhất trong Swift. Sử dụng một biến static let để lưu trữ instance duy nhất của lớp.	

•	**Giải thích**: static let shared = Singleton() tạo một instance duy nhất của lớp Singleton. Phương thức shared sẽ chỉ tạo đối tượng một lần, nhờ tính năng lazy-loading của static. Khi đối tượng được truy cập lần đầu tiên, nó sẽ được khởi tạo và lưu trữ trong bộ nhớ cho đến khi ứng dụng kết thúc.

**2. Cách 2: Sử dụng DispatchQueue (Thread-Safe Singleton)**

Khi cần đảm bảo thread-safety (safety khi truy cập từ nhiều thread cùng một lúc), bạn có thể sử dụng DispatchQueue để đảm bảo rằng chỉ có một luồng duy nhất có thể tạo ra instance của Singleton.

**3. Cách 3: Sử dụng Closure**

Một cách khác để tạo Singleton là sử dụng closure để đảm bảo rằng instance chỉ được tạo ra khi nó được yêu cầu lần đầu tiên.

### 14. Thế nào re-usable trong iOS?

**Reusability** trong iOS là một kỹ thuật giúp tiết kiệm tài nguyên và tăng hiệu quả của ứng dụng bằng cách tạo ra các thành phần giao diện người dùng hoặc mã logic có khả năng tái sử dụng trong nhiều màn hình, nhiều view hoặc nhiều dự án. Điều này không chỉ giúp giảm thiểu việc viết lại mã mà còn đảm bảo tính nhất quán và dễ bảo trì hơn trong suốt vòng đời của ứng dụng.

**1. Re-usable View Components (Các thành phần view tái sử dụng)**

Một trong những cách phổ biến nhất để áp dụng tái sử dụng trong iOS là tạo ra các thành phần giao diện tùy chỉnh (Custom View) hoặc các thành phần UI có khả năng tái sử dụng, đặc biệt trong các ứng dụng có nhiều màn hình. Ví dụ:

​	•	**Custom Views**: Tạo một Custom View hoặc Custom Control bằng cách subclass UIView hoặc UIControl rồi sử dụng lại trong nhiều nơi trong ứng dụng.

​	•	**XIB và NIB**: Sử dụng file XIB hoặc NIB để định nghĩa giao diện và load nó vào nhiều nơi trong ứng dụng.

**2. Reusable Cells trong UITableView và UICollectionView**

UITableView và UICollectionView thường chứa nhiều phần tử giống nhau (cell) nên chúng sử dụng cơ chế **reusable cell** để tăng hiệu suất. Thay vì tạo mới mỗi lần, các cell đã tạo sẽ được **dequeuing** (lấy lại từ hàng đợi) và tái sử dụng, giúp tiết kiệm bộ nhớ và cải thiện hiệu suất.

**3. Sử dụng Protocols và Extensions**

Trong Swift, bạn có thể sử dụng **protocols** để định nghĩa hành vi hoặc chức năng chung mà nhiều lớp có thể tuân thủ. Protocol giúp tái sử dụng logic và tạo tính linh hoạt cho code.

​	•	**Protocols**: Định nghĩa các chức năng chung mà nhiều lớp có thể tuân theo.

​	•	**Extensions**: Sử dụng extensions để thêm chức năng cho các lớp hiện có mà không cần tạo subclass.

**4. View Models trong MVVM**

Khi làm việc với mô hình **MVVM (Model-View-ViewModel)**, bạn có thể tạo ra các ViewModel có khả năng tái sử dụng để quản lý logic cho các View khác nhau. Một ViewModel có thể được sử dụng lại cho nhiều View nếu chúng có logic tương tự, giúp tránh lặp lại mã và tăng tính nhất quán.
### 15. Trình bày về CoreData? Các thành phần của nó?

**Core Data** là một framework mạnh mẽ và phổ biến trong iOS và macOS, được Apple cung cấp để quản lý dữ liệu. Nó đóng vai trò như một **Object-Graph Manager** và **Persistent Store** giúp lưu trữ, truy vấn và quản lý dữ liệu trên thiết bị cục bộ. Core Data không chỉ lưu trữ dữ liệu vào bộ nhớ cục bộ mà còn cung cấp các công cụ giúp giảm thiểu độ phức tạp của việc quản lý dữ liệu, nhờ đó giúp tối ưu hóa hiệu suất và tiết kiệm bộ nhớ.

**Các thành phần chính của Core Data**

Core Data có nhiều thành phần làm việc cùng nhau để quản lý và lưu trữ dữ liệu hiệu quả. Dưới đây là các thành phần chính của Core Data:

​	1.	**Managed Object Model (NSManagedObjectModel)**

​	•	Đây là một sơ đồ hoặc bản thiết kế của tất cả các entity (thực thể) trong ứng dụng. Nó định nghĩa cấu trúc dữ liệu, các thuộc tính của từng entity và mối quan hệ giữa chúng.

​	•	**Managed Object Model** là một tập hợp các entity mà chúng ta định nghĩa trong **Data Model file** (.xcdatamodeld). Nó bao gồm các entity, các thuộc tính, và các mối quan hệ.

​	2.	**Managed Object (NSManagedObject)**

​	•	**NSManagedObject** là một đối tượng đại diện cho các entity trong Core Data, có khả năng lưu trữ dữ liệu của các entity đó vào bộ nhớ và lưu trữ.

​	•	Các **Managed Object** có thể hiểu như là các instance của từng entity, chứa dữ liệu và tuân theo cấu trúc của **Managed Object Model**.

​	•	**NSManagedObject** tự động ánh xạ các thuộc tính và mối quan hệ của một entity trong Core Data thành các thuộc tính trong lớp NSManagedObject.

​	3.	**Persistent Store Coordinator (NSPersistentStoreCoordinator)**

​	•	**Persistent Store Coordinator** chịu trách nhiệm quản lý việc liên kết với kho lưu trữ dữ liệu (persistent store).

​	•	Thành phần này xử lý việc đọc và ghi dữ liệu vào các persistent store (có thể là SQLite, XML, hoặc Binary store).

​	•	**NSPersistentStoreCoordinator** là thành phần trung gian giữa **Managed Object Context** và persistent store.

​	4.	**Persistent Store (NSPersistentStore)**

​	•	Đây là nơi dữ liệu thực sự được lưu trữ, ví dụ như file SQLite hoặc XML.

​	•	Mặc dù Core Data có thể sử dụng nhiều loại persistent store khác nhau, phổ biến nhất trong iOS là SQLite vì tính hiệu quả của nó trong lưu trữ dữ liệu lớn.

​	•	NSPersistentStore là lớp trừu tượng đại diện cho persistent store và được quản lý bởi NSPersistentStoreCoordinator.

​	5.	**Managed Object Context (NSManagedObjectContext)**

​	•	**Managed Object Context** là một vùng lưu trữ tạm thời trong bộ nhớ, nơi chứa các **Managed Object**. Nó cho phép truy cập, thêm, xoá, và sửa đổi dữ liệu.

​	•	Mọi thao tác với dữ liệu trong Core Data đều thực hiện thông qua NSManagedObjectContext.

​	•	**Managed Object Context** đóng vai trò như một “Workspace” (nơi làm việc), giúp quản lý các thao tác trước khi lưu dữ liệu vào persistent store.

​	•	Bạn cần gọi save() trên **Managed Object Context** để lưu các thay đổi từ bộ nhớ tạm thời vào persistent store.

​	6.	**Fetch Request (NSFetchRequest)**

​	•	**Fetch Request** là một yêu cầu lấy dữ liệu từ persistent store.

​	•	Bạn có thể sử dụng NSFetchRequest để truy vấn các object từ Core Data, áp dụng các điều kiện lọc và sắp xếp.

​	•	**NSFetchRequest** thường được thực thi trong **Managed Object Context** để lấy về một danh sách các **Managed Object** đáp ứng điều kiện tìm kiếm.