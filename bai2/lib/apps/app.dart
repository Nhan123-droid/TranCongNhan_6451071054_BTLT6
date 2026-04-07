import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/profile_screen.dart';
import '../utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // NAVIGATE: Định nghĩa màn hình chính khi ứng dụng khởi động
      // home = màn hình đầu tiên được hiển thị
      home: const HomeScreen(),
      
      // ===== NAVIGATE: NAMED ROUTES =====
      // Named Routes dùng để điều hướng đến các màn hình khác nhau
      // Định dạng: '/route_name': (context) => ScreenWidget()
      routes: {
        // NAVIGATE: Route '/profile' - sử dụng ModalRoute để lấy arguments
        '/profile': (context) {
          // Lấy tham số (arguments) từ route settings
          // ModalRoute.of(context)?.settings.arguments - lấy dữ liệu được truyền từ màn hình khác
          // 'as String?' - ép kiểu thành String hoặc null
          // ?? '' - nếu null, mặc định = chuỗi rỗng
          final username = ModalRoute.of(context)?.settings.arguments as String? ?? '';
          // Trả về ProfileScreen với username được truyền
          return ProfileScreen(username: username);
        },
      },
      
      // ===== NAVIGATE: ON GENERATE ROUTE =====
      // Cách thứ 2 để xử lý navigate - được gọi khi không tìm thấy route trong routes{}
      // Hữu ích khi cần dynamic routes
      onGenerateRoute: (settings) {
        // Kiểm tra xem route cần đi là '/profile' không
        if (settings.name == '/profile') {
          // Lấy arguments (dữ liệu được truyền theo)
          final username = settings.arguments as String? ?? '';
          // Tạo MaterialPageRoute mới để điều hướng
          // MaterialPageRoute - tạo hiệu ứng chuyển màn hình kiểu Material
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(username: username),
          );
        }
        return null;
      },
    );
  }
}
