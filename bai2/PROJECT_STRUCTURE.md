# Bài 2: Profile Screen - Passing Arguments với Named Routes

## Cấu trúc dự án

```
lib/
├── main.dart                  # Entry point (in ra MSSV)
├── apps/
│   └── app.dart              # App configuration & named routes
├── models/
│   └── user_model.dart       # User model
├── views/
│   ├── home_screen.dart      # HomeScreen - nhập tên người dùng
│   └── profile_screen.dart   # ProfileScreen - hiển thị profile
├── utils/
│   └── constants.dart        # MSSV & constants
└── widgets/                  # Thư mục cho custom widgets
```

## Hướng dẫn sử dụng

### 1. Thay đổi MSSV
Mở file `lib/utils/constants.dart` và thay đổi giá trị MSSV:
```dart
const String MSSV = 'YOUR_MSSV_HERE';  // ← Thay đổi ở đây
```

### 2. Chạy ứng dụng
```bash
flutter run
```

### 3. Chức năng ứng dụng

**HomeScreen:**
- TextFormField để nhập tên người dùng (validation: không được để trống)
- Nút "Go to Profile" để điều hướng
- Hiển thị MSSV trên giao diện

**ProfileScreen:**
- Hiển thị avatar với chữ cái đầu của tên
- Hiển thị tên người dùng được truyền từ HomeScreen
- Hiển thị MSSV
- Nút quay lại

## Output console

Khi chạy ứng dụng:
```
=== BAI 2: PROFILE SCREEN ===
MSSV: 12345678
===========================
```

Khi navigate đến Profile:
```
MSSV: 12345678 - Navigate to Profile with username: Tên Bạn
MSSV: 12345678 - Profile Screen displayed for user: Tên Bạn
```

## Tổng kết yêu cầu

✅ Tổ chức code với thư mục: apps, models, views, utils, widgets
✅ HomeScreen với TextFormField & nút "Go to Profile"
✅ ProfileScreen hiển thị tên người dùng
✅ Sử dụng Named Routes (/profile) để truyền dữ liệu
✅ Validation tên không được trống
✅ In ra MSSV kèm theo (console & UI)
