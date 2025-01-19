abstract class DatabaseService {
  Future<void> addDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String docPath,
  });

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docPath,
  });

  Future<void> updateDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    required String docPath,
  });

  Future<void> deleteDocument({
    required String collectionPath,
    required String docPath,
  });
}
