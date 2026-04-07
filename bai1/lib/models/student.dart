class Student {
  final String mssv;
  final String name;
  final String email;

  Student({
    required this.mssv,
    required this.name,
    required this.email,
  });

  @override
  String toString() {
    return 'MSSV: $mssv\nName: $name\nEmail: $email';
  }
}
