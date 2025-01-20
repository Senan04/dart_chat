import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dart_chat/providers/service_providers/storage_service_provider.dart';
import 'package:dart_chat/repositories/file_repository.dart';

part 'file_repository_provider.g.dart';

@riverpod
FileRepository fileRepository(Ref ref) {
  final storageService = ref.watch(storageServiceProvider);
  return FileRepository(storageService);
}
