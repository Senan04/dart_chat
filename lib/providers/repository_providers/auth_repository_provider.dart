import 'package:dart_chat/repositories/firebase/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository();
}
