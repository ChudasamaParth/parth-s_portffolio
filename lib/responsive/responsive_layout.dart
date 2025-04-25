import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../sections/home_section.dart';

class ResponsiveLayout extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

  const ResponsiveLayout({
    super.key,
    required this.themeMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Return HomeSection with layoutType based on screen size
        if (constraints.maxWidth >= 1200) {
          // Desktop layout
          return HomeSection(
            themeMode: themeMode,
            toggleTheme: toggleTheme,
          );
        } else if (constraints.maxWidth >= 800) {
          // Tablet layout
          return HomeSection(
            themeMode: themeMode,
            toggleTheme: toggleTheme,
          );
        } else {
          // Mobile layout
          return HomeSection(
            themeMode: themeMode,
            toggleTheme: toggleTheme,
          );
        }
      },
    );
  }
}
