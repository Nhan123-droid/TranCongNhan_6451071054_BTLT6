import 'package:flutter/material.dart';
import 'package:bai5/utils/constants.dart';
import 'package:bai5/widget/color_box_widget.dart';
import 'pick_color_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _selectedColor = Colors.grey;

  void _navigateToPickColorScreen() async {
    final selectedColor = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const PickColorScreen()),
    );

    if (selectedColor != null) {
      setState(() {
        _selectedColor = selectedColor;
      });
      print('Selected color changed. MSSV: $MSSV');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_TITLE),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorBoxWidget(
              selectedColor: _selectedColor,
              onPickColorPressed: _navigateToPickColorScreen,
            ),
            const SizedBox(height: 40),
            Text(
              'MSSV: $MSSV',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
