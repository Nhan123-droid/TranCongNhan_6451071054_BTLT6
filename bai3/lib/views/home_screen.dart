import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widget/custom_elevated_button.dart';

/// ==================== HƯỚNG DẪN ĐIỀU HƯỚNG (NAVIGATION) ====================
/// 
/// Flutter sử dụng "Navigation Stack" (Ngăn xếp điều hướng) để quản lý các screen:
/// 
/// 1. Navigator.push(context, route)
///    - Thêm một screen MỚI vào đầu ngăn xếp
///    - Navigation Stack: [HomeScreen] -> [SettingsScreen]
///    - Màn hình mới sẽ hiển thị với animation slide
/// 
/// 2. Navigator.pop(context)
///    - Xóa screen hiện tại khỏi ngăn xếp
///    - Navigation Stack: [HomeScreen] <- [SettingsScreen được xóa]
///    - Quay lại screen trước đó
/// 
/// 3. MaterialPageRoute
///    - Kiểu chuyển tiếp giữa các màn hình trên Material Design
///    - Cung cấp animation slide từ phải sang trái (hoặc ngược lại khi pop)
/// ============================================================================

/// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.homeTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.welcomeMessage,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                'MSSV: ${AppConstants.mssv}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                label: AppConstants.goToSettings,
                onPressed: () {
                  /// Navigator.push() - Điều hướng đến screen mới
                  /// Nó sẽ thêm screen mới vào Ngăn xếp điều hướng (Navigation Stack)
                  /// Ví dụ: [HomeScreen] -> [SettingsScreen]
                  Navigator.push(
                    /// context - Ngữ cảnh của widget hiện tại, dùng để xác định vị trí trong ứng dụng
                    context,
                    /// MaterialPageRoute - Định nghĩa cách chuyển tiếp giữa các màn hình
                    /// Tạo ra animation slide từ phải qua trái
                    MaterialPageRoute(
                      /// builder - Hàm xây dựng widget mới (SettingsScreen)
                      /// (_) - parameter không dùng đến
                      builder: (_) => const SettingsScreen(),
                    ),
                  );
                },
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.settingsTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.settingsMessage,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                'MSSV: ${AppConstants.mssv}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                label: AppConstants.back,
                onPressed: () {
                  /// Navigator.pop() - Quay lại screen trước đó
                  /// Nó sẽ xóa screen hiện tại khỏi Ngăn xếp điều hướng (Navigation Stack)
                  /// Ví dụ: [HomeScreen] <- [SettingsScreen] (bị xóa)
                  Navigator.pop(context);
                },
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
