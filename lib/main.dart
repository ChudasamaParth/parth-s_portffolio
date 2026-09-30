import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/home_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = _buildTheme(Brightness.light);
    final darkTheme = _buildTheme(Brightness.dark);

    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: HomeSection(themeMode: _themeMode, toggleTheme: _toggleTheme),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: brightness,
    ),
    useMaterial3: true,
  );
  final textTheme = GoogleFonts.manropeTextTheme(theme.textTheme);

  return theme.copyWith(
    textTheme: textTheme.copyWith(
      displayLarge: GoogleFonts.spaceGrotesk(textStyle: textTheme.displayLarge),
      displayMedium: GoogleFonts.spaceGrotesk(
        textStyle: textTheme.displayMedium,
      ),
      displaySmall: GoogleFonts.spaceGrotesk(textStyle: textTheme.displaySmall),
      headlineLarge: GoogleFonts.spaceGrotesk(
        textStyle: textTheme.headlineLarge,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        textStyle: textTheme.headlineMedium,
      ),
      headlineSmall: GoogleFonts.spaceGrotesk(
        textStyle: textTheme.headlineSmall,
      ),
    ),
  );
}
