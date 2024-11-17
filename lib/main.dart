import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 1, 31, 26),
// );

// final theme = ThemeData().copyWith(
//   colorScheme: colorScheme,
//   scaffoldBackgroundColor: colorScheme.surface,
//   textTheme: GoogleFonts.latoTextTheme().apply(bodyColor: Colors.white),
// );

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DartChat',
      theme: FlexThemeData.light(scheme: FlexScheme.cyanM3),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.cyanM3),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
