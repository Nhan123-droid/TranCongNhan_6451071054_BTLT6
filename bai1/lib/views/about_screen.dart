import 'package:flutter/material.dart';
import '../models/student.dart';
import '../utils/routes.dart';
import '../widgets/custom_widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = Student(
      mssv: AppRoutes.mssv,
      name: AppRoutes.studentName,
      email: AppRoutes.studentEmail,
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'About our company'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Về Công Ty',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            InfoCard(
              title: 'MSSV',
              content: student.mssv,
            ),
            InfoCard(
              title: 'Tên sinh viên',
              content: student.name,
            ),
            InfoCard(
              title: 'Email',
              content: student.email,
            ),
            const SizedBox(height: 20),
            InfoCard(
              title: 'Giới thiệu',
              content: 'Đây là ứng dụng Flutter với Navigation sử dụng Named Routes.',
            ),
            const SizedBox(height: 40),
            CustomButton(
              label: 'Quay Lại',
              onPressed: () {
                print('MSSV: ${student.mssv}');
                
                /// Navigator.pop(context):
                /// - pop: Xóa route hiện tại ra khỏi stack của Navigator
                /// - context: Bối cảnh hiện tại
                /// 
                /// Kết quả: Quay lại màn hình trước đó (Home)
                /// Lưu ý: Navigator.pop chỉ hoạt động nếu có route trước đó
                /// Nếu đó là route âm thầu (không có route trước), app sẽ đóng
                Navigator.pop(context);
              },
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
