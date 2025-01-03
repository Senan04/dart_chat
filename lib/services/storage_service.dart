import 'dart:io';

abstract class StorageService {
  /// Adds or replaces a [File] to the Storage and returns a [Future] that resolves to a [String] containing the download URL.
  Future<String> addFile(
    File file, {
    required String path,
    required String fileName,
  });

  /// Deletes the [File] at specified `url`
  Future<void> deleteFile(String url);
}
