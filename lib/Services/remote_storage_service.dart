import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class RemoteStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Adds or replaces a [File] to the Storage and returns a [Future] that resolves to a [String] containing the download URL.
  Future<String> addFile({
    required File file,
    required String path,
    required String fileName,
  }) async {
    final storageRef = _storage.ref().child(path).child(fileName);

    await storageRef.putFile(file);

    final imageUrl = await storageRef.getDownloadURL();

    return imageUrl;
  }

  /// Deletes the [File] at specified `url`
  Future<void> deleteFile(String url) async {
    await _storage.refFromURL(url).delete();
  }
}
