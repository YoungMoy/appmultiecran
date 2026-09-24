// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
