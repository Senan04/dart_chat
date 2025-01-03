abstract class DatabaseService {
  Future<void> addDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docPath,
  });

  Future<void> updateDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  });

  Future<void> deleteDocument({
    required String collectionPath,
    required String docPath,
  });
}
