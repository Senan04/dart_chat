import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/services/storage_service.dart';
import 'package:dart_chat/services/firebase/firebase_storage_service.dart';

part 'storage_service_provider.g.dart';

@riverpod
StorageService storageService(Ref ref) {
  return FirebaseStorageService();
}
