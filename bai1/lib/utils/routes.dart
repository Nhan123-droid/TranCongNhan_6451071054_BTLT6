/// Lớp AppRoutes chứa tất cả các hằng số liên quan đến routing và dữ liệu sinh viên
/// Sử dụng hằng số để tránh lỗi typo khi sử dụng route names
class AppRoutes {
  /// Route cho màn hình Home
  /// '/' là route mặc định (initialRoute)
  static const String home = '/';
  
  /// Route cho màn hình About
  /// Được sử dụng khi gọi: Navigator.pushNamed(context, AppRoutes.about)
  static const String about = '/about';
  
  /// MSSV của sinh viên - Được hiển thị trong tiêu đề app, card thông tin và console
  static const String mssv = '6451071054';
  
  /// Tên sinh viên
  static const String studentName = 'Nhan';
  
  /// Email sinh viên
  static const String studentEmail = 'sv@example.com';
}
