import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:dart_chat/services/storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> addFile(
    File file, {
    required String path,
    required String fileName,
  }) async {
    final storageRef = _storage.ref().child(path).child(fileName);

    await storageRef.putFile(file);

    final imageUrl = await storageRef.getDownloadURL();

    return imageUrl;
  }

  @override
  Future<void> deleteFile(String url) async {
    await _storage.refFromURL(url).delete();
  }
}
