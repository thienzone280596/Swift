# InterView Flutter

### 1. Widget trong Flutter là gì?

Trong Flutter, **Widget** là thành phần cơ bản nhất và cũng là phần không thể thiếu trong việc xây dựng giao diện người dùng (UI). Mọi thành phần trong Flutter, từ các điều khiển UI như nút bấm, văn bản, hình ảnh, cho đến các bố cục và container, đều là Widget.

#### Đặc điểm chính của Widget trong Flutter:

1. **Immutable**: Widget trong Flutter là immutable, nghĩa là sau khi được tạo ra, chúng không thể thay đổi trạng thái. Thay vào đó, khi cần cập nhật UI, Flutter sẽ tạo ra một Widget mới với trạng thái mới.
2. **Composition**: Flutter xây dựng UI bằng cách lồng ghép các Widget vào nhau, tạo thành cây Widget (Widget tree). Cách tiếp cận này giúp việc xây dựng và quản lý UI trở nên linh hoạt và dễ dàng hơn.

#### Các loại Widget:

1. **StatelessWidget**: Đây là loại Widget không có trạng thái nội tại. Nó chỉ phụ thuộc vào dữ liệu được truyền vào khi khởi tạo và không thay đổi trong suốt vòng đời của nó.

```dart
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, Flutter!');
  }
}
```

2. **StatefulWidget**: Đây là loại Widget có thể thay đổi trạng thái trong suốt vòng đời của nó. StatefulWidget bao gồm hai phần: một lớp StatefulWidget và một lớp State liên kết.

   ```dart
   class MyStatefulWidget extends StatefulWidget {
     @override
     _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
   }
   
   class _MyStatefulWidgetState extends State<MyStatefulWidget> {
     String text = 'Hello, Flutter!';
     
     void _updateText() {
       setState(() {
         text = 'Text updated!';
       });
     }
   
     @override
     Widget build(BuildContext context) {
       return Column(
         children: [
           Text(text),
           ElevatedButton(
             onPressed: _updateText,
             child: Text('Update Text'),
           ),
         ],
       );
     }
   }
   ```

   ### Các Widget cơ bản trong Flutter:

   - **Text**: Hiển thị văn bản.
   - **Image**: Hiển thị hình ảnh.
   - **Container**: Một Widget tiện ích để chứa và định vị các Widget khác.
   - **Column**: Bố trí các Widget theo chiều dọc.
   - **Row**: Bố trí các Widget theo chiều ngang.
   - **ListView**: Hiển thị một danh sách cuộn.
   - **ElevatedButton**: Một nút bấm.

### 2. Tệp pubspec.yaml là gì?

​	Tệp pubspec.yaml là tệp cấu hình của dự án được sử dụng thường xuyên trong quá trình làm việc với Flutter. Nó cho phép bạn 	thiết lập những ràng buộc và cách một ứng dụng hoạt động như thế nào. 

### 3. Lý do build app Flutter lần đầu lại cần nhiều thời gian?

Build app Flutter lần đầu tiên mất nhiều thời gian vì Flutter đã xây dựng tệp APK / IPA dành riêng cho thiết bị. Vậy nên Gradle và Xcode được dùng để xây dựng tệp, mất tương đối nhiều thời gian.

### 4. So sánh các hàm “main()” và “runApp()” trong Flutter?

- Hàm main() chịu trách nhiệm cho việc khởi động chương trình. 
- Hàm runApp() có trách nhiệm trả về các widget được gắn vào màn hình ở dưới dạng gốc của cây widget, và nó sẽ được hiển thị trên màn hình.

### 5. Stream trong Flutter là gì?

Bản chất Stream trong Flutter là một luồng data bất đồng bộ. Nó tương tự như là một cái ống có hai dữ liệu đầu vào và dữ liệu đầu ra.

### 6. Các loại Stream trong Flutter?

Stream trong Flutter có thể có hai loại là **Single subscription streams (Các luồng đăng ký đơn lẻ) và Broadcast streams (Các luồng phát sóng)**

### 7. Kể tên những chế độ build khác nhau trong Flutter ?

Các chế độ build khác nhau trong Flutter là Debug, Profile và Release.

### 8. Key trong Flutter là gì?

Các Key trong Flutter được sử dụng với mục đích là làm code định danh cho Widget, Elements và Semantics Nodes. 

### 9. Liệt kê một số tính năng quan trọng của Flutter

Câu hỏi phỏng vấn Flutter này thường sẽ xuất hiện ở phần đầu cuộc phỏng vấn. Một số tính năng quan trọng của Flutter bao gồm:

- Hot reload: Tính năng Hot reload của Flutter cho phép các nhà phát triển thấy ngay những thay đổi được thực hiện đối với mã mà không cần khởi động lại ứng dụng, cho phép lặp lại quá trình phát triển nhanh hơn.
- Giao diện người dùng dựa trên tiện ích: Flutter sử dụng cách tiếp cận dựa trên tiện ích, trong đó toàn bộ giao diện người dùng bao gồm các tiện ích khác nhau. Điều này cho phép các thành phần giao diện người dùng được mô-đun hoá và có thể tái sử dụng.
- Khả năng tùy biến cao: Flutter cung cấp các tùy chọn tùy biến rộng rãi, cho phép các nhà phát triển tạo giao diện người dùng hấp dẫn, trực quan.
- Hiệu suất gốc: Các ứng dụng Flutter được biên dịch thành mã gốc, mang lại trải nghiệm người dùng hiệu suất cao.
- Hỗ trợ hoạt ảnh phong phú: Flutter cung cấp API hoạt ảnh mạnh mẽ với một loạt các hoạt ảnh dựng sẵn, giúp dễ dàng tạo các giao diện tương tác, hấp dẫn và vô cùng trực quan.

### 10. Cho biết sự khác biệt giữa Hot Reload và Hot Restart

- Hot reload: Hot reload là một tính năng mạnh mẽ trong Flutter cho phép các nhà phát triển xem các thay đổi được thực hiện đối với mã ngay lập tức mà không làm mất trạng thái hiện tại của ứng dụng. Nó cập nhật giao diện người dùng trong thời gian thực, giúp quá trình phát triển nhanh hơn và hiệu quả hơn.
- Hot restart: Mặt khác, Hot restart sẽ khởi động lại hoàn toàn ứng dụng Flutter. Nó loại bỏ trạng thái ứng dụng hiện tại và tải lại toàn bộ ứng dụng từ đầu. Hot restart rất hữu ích khi có các thay đổi đối với phần phụ thuộc của ứng dụng hoặc khi các thay đổi về mã không được phản ánh chính xác với Hot reload.

### 11. Giải thích BuildContext là gì

BuildContext là một khái niệm cơ bản trong Flutter và đại diện cho ngữ cảnh trong đó một widget được tạo. Nó cung cấp quyền truy cập vào các thông tin và dịch vụ khác nhau liên quan đến cây widget, chẳng hạn như dữ liệu chủ đề, truy vấn phương tiện và các widget kế thừa. BuildContext được truyền xuống cây widget và được các widget sử dụng để lấy tài nguyên và xây dựng giao diện người dùng của chúng dựa trên ngữ cảnh cụ thể.

### 12. Mô tả vòng đời của một Stateful Widget

![Mô tả vòng đời của một Stateful Widget](https://topdev.vn/blog/wp-content/uploads/2023/04/statelesswidget-vs-statefulwidget-scaled.webp)

Vòng đời của một stateful Widget có 7 trạng thái bao gồm:

- **createState**: khi class được khởi tạo thì hàm này sẽ được gọi đầu tiên
- **initState**: gọi ngay khi Widget được tạo
- **didChangeDependencies**: hàm này được gọi ngay sau initState và được gọi lại khi dependency của state thay đổi
- **build**: sau khi didChangeDependencies được gọi thì hàm build sẽ được gọi để thực hiện việc render UI lên màn hình
- **didUpdateWidget**: hàm được gọi khi Widget configuration thay đổi, sau khi hàm này được gọi thì hàm build sẽ được gọi để render lại UI
- **deactive**: hàm được gọi khi widget bị xóa khỏi cây widget
- **dispose**: hàm được gọi khi widget bị xóa vĩnh viễn khỏi cây widget

### 13. Cách điều hướng màn hình trong Flutter

Thông thường có 3 cách điều hướng màn hình trong Flutter:

- **Điều hướng trực tiếp**: sử dụng MaterialPageRoute nhận tham số khởi tạo class màn hình điều hướng đến, giá trị trả về là một Route. Sau đó sử dụng Navigator.push để điều hướng đến route vừa tạo.
- **Điều hướng tĩnh**: khai báo trước một Map routes trong MaterialApp. Để điều hướng đến màn hình thì chúng ta sử dụng thông qua route name sử dụng phương thức Navigator.pushNamed.
- **Điều hướng động**: MaterialApp cung cấp phương thức onGenerateRoute giúp tạo route chính xác dựa trên class RouteSettings. Ưu điểm của method này là giúp bạn handle tất cả các đường dẫn trong một logic xử lý.

### 14. Giải thích về Bloc Pattern

Bloc (Business Logic Component) Pattern là một kiến trúc phổ biến trong phát triển ứng dụng, đặc biệt là trong Flutter, để quản lý trạng thái của ứng dụng một cách rõ ràng và có cấu trúc. Dưới đây là các khái niệm chính và cách hoạt động của Bloc Pattern:

### 1. **Event (Sự kiện)**

- Đây là các hành động hoặc sự kiện được kích hoạt từ giao diện người dùng (UI) hoặc từ các nguồn khác.
- Mỗi sự kiện thường đại diện cho một hành động cụ thể, chẳng hạn như nhấn nút, thay đổi giá trị của một trường nhập liệu, hoặc tải dữ liệu từ một API.

### 2. **State (Trạng thái)**

- Trạng thái đại diện cho tình trạng hiện tại của ứng dụng hoặc một phần của ứng dụng.
- Mỗi thay đổi trong ứng dụng sẽ dẫn đến một trạng thái mới, và giao diện người dùng sẽ được cập nhật dựa trên trạng thái này.

### 3. **Bloc**

- Bloc là nơi xử lý các sự kiện và quản lý trạng thái.
- Khi một sự kiện được kích hoạt, Bloc sẽ nhận sự kiện đó, thực hiện các tác vụ cần thiết (như truy xuất dữ liệu từ API, xử lý logic), và sau đó phát ra trạng thái mới.
- Bloc đóng vai trò trung gian giữa UI và dữ liệu/logic của ứng dụng, giúp tách biệt giao diện người dùng với logic kinh doanh.

### 4. **Stream**

- Bloc sử dụng các Stream để phát ra sự kiện và trạng thái.
- Các Widget trong Flutter sẽ lắng nghe (listen) các Stream này để cập nhật giao diện khi có sự thay đổi trạng thái.

### Cách Bloc Pattern hoạt động

1. **Sự kiện được kích hoạt:** Người dùng thực hiện một hành động (như nhấn nút) và sự kiện này được gửi đến Bloc.
2. **Bloc xử lý sự kiện:** Bloc nhận sự kiện, thực hiện các xử lý cần thiết (như gọi API, tính toán, xử lý logic) và phát ra trạng thái mới.
3. **Cập nhật giao diện:** Các Widget lắng nghe trạng thái từ Bloc sẽ nhận trạng thái mới và cập nhật giao diện tương ứng.

### Lợi ích của Bloc Pattern

- **Tách biệt rõ ràng:** Tách biệt rõ ràng giữa logic kinh doanh và giao diện người dùng.
- **Quản lý trạng thái dễ dàng:** Quản lý trạng thái một cách nhất quán và có cấu trúc.
- **Tái sử dụng:** Dễ dàng tái sử dụng logic kinh doanh giữa các phần khác nhau của ứng dụng.
- **Dễ kiểm thử:** Dễ dàng kiểm thử logic kinh doanh mà không cần phụ thuộc vào giao diện người dùng.