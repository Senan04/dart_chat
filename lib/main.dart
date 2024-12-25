import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:dart_chat/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const AuthScreen(),
    );
  }
}
