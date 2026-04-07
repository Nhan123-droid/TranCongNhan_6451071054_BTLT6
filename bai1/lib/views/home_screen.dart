import 'package:flutter/material.dart';
import '../models/student.dart';
import '../utils/routes.dart';
import '../widgets/custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = Student(
      mssv: AppRoutes.mssv,
      name: AppRoutes.studentName,
      email: AppRoutes.studentEmail,
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'Go to About'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Trang Chủ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            InfoCard(
              title: 'Thông tin sinh viên',
              content: student.toString(),
            ),
            const SizedBox(height: 40),
            CustomButton(
              label: 'Go to About',
              onPressed: () {
                print('MSSV: ${student.mssv}');
                
                /// Navigator.pushNamed(context, AppRoutes.about):
                /// - Navigator: Quản lý stack của các màn hình (screens)
                /// - pushNamed: Thêm một route mới vào stack
                /// - context: Bối cảnh hiện tại của Widget
                /// - AppRoutes.about: Tên route muốn navigate tới (định nghĩa trong routes.dart)
                /// 
                /// Kết quả: Màn hình akan chuyển từ Home -> About
                /// Người dùng có thể bấm nút Back để quay lại Home
                Navigator.pushNamed(context, AppRoutes.about);
              },
            ),
          ],
        ),
      ),
    );
  }
}
