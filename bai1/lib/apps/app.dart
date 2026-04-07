import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../views/home_screen.dart';
import '../views/about_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App - MSSV: ${AppRoutes.mssv}',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      /// initialRoute: Định nghĩa route ban đầu khi ứng dụng khởi động
      /// Trong trường hợp này, ứng dụng sẽ bắt đầu từ route '/' (HomeScreen)
      initialRoute: AppRoutes.home,
      
      /// routes: Là một Map định nghĩa tất cả các routes (đường dẫn) trong ứng dụng
      /// Key là tên route (String), Value là một function que return Widget tương ứng
      /// Cách sử dụng: Navigator.pushNamed(context, '/about')
      /// Map này giống như một bộ từ điển: 'đường dẫn' -> 'màn hình'
      routes: {
        /// Route HOME: '/' sẽ hiển thị HomeScreen
        AppRoutes.home: (context) => const HomeScreen(),
        
        /// Route ABOUT: '/about' sẽ hiển thị AboutScreen
        AppRoutes.about: (context) => const AboutScreen(),
      },
    );
  }
}
