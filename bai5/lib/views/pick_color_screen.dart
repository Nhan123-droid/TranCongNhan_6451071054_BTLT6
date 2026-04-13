import 'package:flutter/material.dart';
import 'package:bai5/models/color_model.dart';
import 'package:bai5/utils/constants.dart';

class PickColorScreen extends StatelessWidget {
  const PickColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ColorModel> colors = [
      ColorModel(name: 'Red', color: Colors.red),
      ColorModel(name: 'Blue', color: Colors.blue),
      ColorModel(name: 'Green', color: Colors.green),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Color'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final colorModel = colors[index];
          return GestureDetector(
            onTap: () {
              print('Selected: ${colorModel.name} - MSSV: $MSSV');
              Navigator.pop(context, colorModel.color);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorModel.color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.color_lens, color: Colors.white, size: 28),
                  const SizedBox(width: 16),
                  Text(
                    colorModel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
