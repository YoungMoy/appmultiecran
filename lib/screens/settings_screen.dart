import 'package:flutter/material.dart';
import 'package:appmultiecran/widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  const SettingsScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: Center(
        child: ThemeSwitcher(
          isDarkMode: isDark,
          onToggle: toggleTheme,
        ),
      ),
    );
  }
}
