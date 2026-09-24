// lib/widgets/theme_switcher.dart
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const ThemeSwitcher({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Mode sombre"),
      value: isDarkMode,
      onChanged: onToggle,
      secondary: const Icon(Icons.brightness_6),
    );
  }
}
