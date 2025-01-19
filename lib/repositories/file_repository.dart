import 'dart:io';

import 'package:dart_chat/services/storage_service.dart';

class FileRepository {
  final StorageService _storageService;

  FileRepository(this._storageService);

  Future<String> addFile(
    File file, {
    required String path,
    required String fileName,
  }) async {
    return await _storageService.addFile(file, path: path, fileName: fileName);
  }

  Future<String> updateFile(
    File file, {
    required String path,
    required String fileName,
  }) async {
    return await _storageService.addFile(file, path: path, fileName: fileName);
  }

  Future<void> deleteFile(String url) async {
    return await _storageService.deleteFile(url);
  }
}
