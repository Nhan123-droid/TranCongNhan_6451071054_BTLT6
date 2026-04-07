# 📚 HƯỚNG DẪN NAVIGATE - Chi Tiết Từng Bước

## 🎯 Các khái niệm chính về Navigation trong Flutter

### 1. Navigation Stack (Ngăn xếp điều hướng)
```
Như một chồng tờ giấy:
┌─────────────────┐
│ ProfileScreen   │ ← Hiện tại (trên cùng)
├─────────────────┤
│ HomeScreen      │ 
├─────────────────┤
│ SplashScreen    │ ← Dưới cùng
└─────────────────┘
```

---

## 📍 Phương thức 1: Navigator.pushNamed() - Đi tới màn hình mới

### Ở HomeScreen - Khi click nút "Go to Profile":

```dart
Navigator.pushNamed(
  context,                    // Ngữ cảnh hiện tại
  '/profile',                 // Tên route được định nghĩa
  arguments: username,        // Dữ liệu truyền đi
);
```

**Diễn giải:**
- `pushNamed()` = Thêm màn hình mới vào stack (đẩy lên)
- `'/profile'` = Route name (tên đến nơi, phải định nghĩa trong app.dart)
- `arguments: username` = Gói dữ liệu để truyền

**Navigation Stack trở thành:**
```
┌──────────────────┐
│ ProfileScreen    │ ← pushNamed('/profile', arguments: 'Tên User')
├──────────────────┤
│ HomeScreen       │ ← Vị trí hiện tại
└──────────────────┘
```

---

## 🔄 Phương thức 2: Navigator.pop() - Quay lại

### Ở ProfileScreen - Khi click nút quay lại:

```dart
Navigator.pop(context);
```

**Diễn giải:**
- `pop()` = Lấy bỏ màn hình trên cùng khỏi stack (quay lại)
- Quay trở lại HomeScreen

**Navigation Stack trở thành:**
```
┌──────────────────┐
│ HomeScreen       │ ← pop() - quay lại
└──────────────────┘
```

---

## 🗺️ Định nghĩa Routes - Ở app.dart (MyApp)

### Cách 1: Dùng `routes`
```dart
routes: {
  '/profile': (context) {
    // Lấy arguments được truyền
    final username = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return ProfileScreen(username: username);
  },
}
```

**Cách hoạt động:**
1. User gọi `Navigator.pushNamed(context, '/profile', arguments: 'John')`
2. Flutter tìm '/profile' trong routes {}
3. Gọi builder function: `(context) { ... }`
4. Lấy arguments từ `ModalRoute.of(context)?.settings.arguments`
5. Tạo `ProfileScreen(username: 'John')`
6. Hiển thị ProfileScreen

### Cách 2: Dùng `onGenerateRoute` (nâng cao)
```dart
onGenerateRoute: (settings) {
  if (settings.name == '/profile') {
    final username = settings.arguments as String? ?? '';
    return MaterialPageRoute(
      builder: (context) => ProfileScreen(username: username),
    );
  }
  return null;
}
```

**Khác nhau:**
- `routes` - Đơn giản, tĩnh (routes cố định)
- `onGenerateRoute` - Linh hoạt hơn, có thể xử lý động

---

## 🔗 Luồng hoàn chỉnh của ứng dụng

### Bước 1: Ứng dụng khởi động
```dart
// main.dart
void main() {
  runApp(const MyApp());  // Khởi động MyApp
}

// app.dart
class MyApp extends StatelessWidget {
  home: const HomeScreen(),  // ← Màn hình đầu tiên
}
```
**Stack:** `[HomeScreen]`

---

### Bước 2: User nhập tên và click "Go to Profile"
```dart
// home_screen.dart
void _navigateToProfile() {
  final username = _usernameController.text;  // Username = "John"
  
  Navigator.pushNamed(
    context,
    '/profile',           // Route name
    arguments: username,  // Truyền "John"
  );
}
```
**Stack:** `[HomeScreen, ProfileScreen]`

---

### Bước 3: ProfileScreen nhận dữ liệu
```dart
// app.dart - routes
'/profile': (context) {
  final username = ModalRoute.of(context)?.settings.arguments as String? ?? '';
  // username = "John"
  return ProfileScreen(username: username);
}

// profile_screen.dart - constructor
const ProfileScreen({super.key, required this.username});
// this.username = "John"
```

---

### Bước 4: Click nút quay lại
```dart
// profile_screen.dart
onPressed: () {
  Navigator.pop(context);  // Loại bỏ ProfileScreen khỏi stack
}
```
**Stack:** `[HomeScreen]` - Quay trở lại HomeScreen

---

## 📊 Bảng so sánh các cách Navigate

| Phương thức | Mục đích | Sử dụng | Truyền dữ liệu |
|-----------|---------|--------|----------------|
| `pushNamed()` | Đi tới route mà không cần nếu nó đã tồn tại | Named Routes | arguments: |
| `push()` | Đi tới MaterialPageRoute trực tiếp | Tạo route trực tiếp | không cần |
| `pop()` | Quay lại (xóa top of stack) | Nút quay lại | không cần |
| `pushReplacementNamed()` | Thay thế màn hình hiện tại | Đặc trường (login) | arguments: |
| `pushNamedAndRemoveUntil()` | Quay về tới một điểm nhất định | Reset stack | arguments: |

---

## 💡 Ví dụ thực tế khác

### Ví dụ: Đi tới route với ID sản phẩm
```dart
// Gửi
Navigator.pushNamed(
  context,
  '/product',
  arguments: 123,  // ID sản phẩm
);

// Nhận (app.dart)
'/product': (context) {
  final productId = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
  return ProductScreen(productId: productId);
}
```

### Ví dụ: Đi tới route mà không có arguments
```dart
// Gửi
Navigator.pushNamed(context, '/settings');

// Nhận (app.dart)
'/settings': (context) {
  return const SettingsScreen();
}
```

---

## 🐛 Lỗi thường gặp và cách khắc phục

### Lỗi 1: Route không tìm thấy
```
Exception: Could not find a generator for route /profile
```
**Nguyên nhân:** Route '/profile' chưa được định nghĩa trong routes {} hoặc onGenerateRoute
**Cách sửa:** Thêm route vào app.dart

### Lỗi 2: Arguments có kiểu sai
```dart
// Sai - truyền int nhưng nhận String
final username = settings.arguments as String;  // Runtime error

// Đúng - dùng type checking
final username = settings.arguments as String? ?? 'Unknown';
```

### Lỗi 3: Gọi pop() khi chỉ có 1 màn hình
```
Pop called with only one route on the stack
```
**Cách sửa:** Kiểm tra trước pop hay thêm điều kiện

---

## 📝 Tóm tắt nhanh

```
🏠 HomeScreen (Màn hình đầu tiên)
  ↓
  [Click nút "Go to Profile"]
  ↓
📱 Navigator.pushNamed('/profile', arguments: 'John')
  ↓
🗺️ app.dart tìm route '/profile'
  ↓
👤 ProfileScreen nhận username = 'John'
  ↓
  [Click nút quay lại]
  ↓
🔙 Navigator.pop(context)
  ↓
🏠 Quay trở lại HomeScreen
```

---

## ✅ Checklist khi sử dụng Navigator

- [ ] Définir route trong app.dart (routes {} hoặc onGenerateRoute)
- [ ] Sử dụng pushNamed() với đúng tên route
- [ ] Truyền arguments nếu cần
- [ ] Nhận arguments bằng settings.arguments hoặc ModalRoute.of()
- [ ] Type casting đúng (as String?, as int?, etc.)
- [ ] Xử lý null case (??  'default value')
- [ ] Gọi pop() để quay lại
