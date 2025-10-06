import 'package:dart_chat/repositories/firebase/firebase_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return FirebaseUserRepository();
}
