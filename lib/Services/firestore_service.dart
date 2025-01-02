import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) {
    _firestore.collection(collectionPath).doc(docPath).set(data);
  }

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docPath,
  }) async {
    final snapshot =
        await _firestore.collection(collectionPath).doc(docPath).get();

    return snapshot.data();
  }

  Future<void> updateDocument({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionPath).doc(docPath).update(data);
  }

  Future<void> deleteDocument({
    required String collectionPath,
    required String docPath,
  }) async {
    await _firestore.collection(collectionPath).doc(docPath).delete();
  }
}
