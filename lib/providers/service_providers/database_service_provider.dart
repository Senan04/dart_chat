import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/services/database_service.dart';
import 'package:dart_chat/services/firebase/firestore_service.dart';

part 'database_service_provider.g.dart';

@riverpod
DatabaseService databaseService(Ref ref) {
  return FirestoreService();
}
