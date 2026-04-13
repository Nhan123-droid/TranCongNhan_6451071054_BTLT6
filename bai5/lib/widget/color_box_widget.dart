import 'package:flutter/material.dart';

class ColorBoxWidget extends StatelessWidget {
  final Color selectedColor;
  final VoidCallback onPickColorPressed;

  const ColorBoxWidget({
    super.key,
    required this.selectedColor,
    required this.onPickColorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: selectedColor,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: onPickColorPressed,
          icon: const Icon(Icons.palette),
          label: const Text('Pick Color'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
