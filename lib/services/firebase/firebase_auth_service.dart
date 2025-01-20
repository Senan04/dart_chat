import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:dart_chat/services/auth_service.dart';
import 'package:dart_chat/exceptions/auth_exceptions.dart';

class FirebaseAuthService implements AuthService {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;

  @override
  Future<String?> registerWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials.user?.uid;
    } on firebase.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'invalid-email':
          throw InvalidEmailException();
        case 'weak-password':
          throw WeakPasswordException();
        case 'network-request-failed':
          throw NetworkRequestFailedException();
        case 'user-token-expired':
          throw UserTokenExpiredException();
        default:
          throw UnknownAuthException(e.message ?? 'Unknown Auth Exception');
      }
    }
  }

  @override
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials.user?.uid;
    } on firebase.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'network-request-failed':
          throw NetworkRequestFailedException();
        case 'user-token-expired':
          throw UserTokenExpiredException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'wrong-password':
          throw WrongPasswordException();
        default:
          throw UnknownAuthException(e.message ?? 'Unknown Auth Exception');
      }
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();

  @override
  Stream<String?> authStateChanges() {
    return _auth.authStateChanges().map((firebaseUser) => firebaseUser?.uid);
  }

  @override
  String? get currentUserID => _auth.currentUser?.uid;
}
