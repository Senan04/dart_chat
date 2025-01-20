import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/providers/service_providers/database_service_provider.dart';
import 'package:dart_chat/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return UserRepository(databaseService);
}
