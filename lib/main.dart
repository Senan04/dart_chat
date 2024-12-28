import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dart_chat/firebase_options.dart';
import 'package:dart_chat/screens/chat.dart';
import 'package:dart_chat/screens/log_in.dart';
import 'package:dart_chat/screens/splash.dart';

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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          return snapshot.hasData ? const ChatScreen() : const LogInScreen();
        },
      ),
    );
  }
}
