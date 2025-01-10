import 'dart:io';

abstract class StorageService {
  /// Overrides the [File] if it already exists.
  Future<String> addFile(
    File file, {
    required String path,
    required String fileName,
  });

  Future<void> deleteFile(String url);
}
