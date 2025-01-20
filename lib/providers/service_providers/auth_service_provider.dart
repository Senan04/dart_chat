import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/services/auth_service.dart';
import 'package:dart_chat/services/firebase/firebase_auth_service.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return FirebaseAuthService();
}
