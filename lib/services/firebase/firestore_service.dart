import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dart_chat/services/database_service.dart';

class FirestoreService extends DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionPath).doc(docPath).set(data);
  }

  @override
  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docPath,
  }) async {
    final snapshot =
        await _firestore.collection(collectionPath).doc(docPath).get();

    return snapshot.data();
  }

  @override
  Future<void> updateDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionPath).doc(docPath).update(data);
  }

  @override
  Future<void> deleteDocument({
    required String collectionPath,
    required String docPath,
  }) async {
    await _firestore.collection(collectionPath).doc(docPath).delete();
  }
}
