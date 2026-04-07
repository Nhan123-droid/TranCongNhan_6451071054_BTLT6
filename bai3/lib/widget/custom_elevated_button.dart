import 'package:flutter/material.dart';

/// Custom elevated button widget
class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          foregroundColor: foregroundColor ?? Colors.white,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
