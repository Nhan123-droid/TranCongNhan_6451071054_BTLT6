import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    print('MSSV: $MSSV - Profile Screen displayed for user: $username');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
        centerTitle: true,
        // ===== NAVIGATE: Navigator.pop =====
        // pop() - Quay lại màn hình trước đó
        // Nó loại bỏ màn hình hiện tại khỏi navigation stack
        // Ví dụ:
        // - Nếu user từ HomeScreen -> navigate -> ProfileScreen
        // - Khi pop(), sẽ quay trở lại HomeScreen
        // Navigation Stack quản lý việc này: [HomeScreen] -> [HomeScreen, ProfileScreen]
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // NAVIGATE: Gọi pop() để quay lại
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Text(
                username.isNotEmpty ? username[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Tên người dùng:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              username,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'MSSV: $MSSV',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
