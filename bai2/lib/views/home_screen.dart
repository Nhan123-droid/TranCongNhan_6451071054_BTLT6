import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _navigateToProfile() {
    // Kiểm tra validation từ form
    if (_formKey.currentState!.validate()) {
      // Lấy text từ TextEditingController
      final username = _usernameController.text;
      
      // ===== NAVIGATE: Navigator.pushNamed =====
      // pushNamed() - Điều hướng đến route được định nghĩa trong app.dart
      // context - ngữ cảnh của widget hiện tại
      // '/profile' - tên route được định nghĩa trong MyApp -> routes{}
      // arguments: username - Truyền dữ liệu (username) theo route
      // Phương thức này sẽ:
      // 1. Tìm route '/profile' trong routes{}
      // 2. Truyền username vào settings.arguments
      // 3. Gọi builder function để tạo ProfileScreen
      // 4. Thêm ProfileScreen lên navigation stack
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: username,
      );
      print('MSSV: $MSSV - Navigate to Profile with username: $username');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nhập tên người dùng',
                  hintText: 'Tên của bạn',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _navigateToProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text('Go to Profile'),
              ),
              const SizedBox(height: 30),
              Text(
                'MSSV: $MSSV',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
