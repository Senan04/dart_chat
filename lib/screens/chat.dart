import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
