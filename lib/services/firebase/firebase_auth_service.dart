import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:dart_chat/services/auth_service.dart';
import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:dart_chat/models/user.dart';

class FirebaseAuthService extends AuthService {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;

  @override
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _mapFirebaseUserToUser(userCredentials.user);
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
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _mapFirebaseUserToUser(userCredentials.user);
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
  Stream<User?> authStateChanges() {
    return _auth
        .authStateChanges()
        .map((firebaseUser) => _mapFirebaseUserToUser(firebaseUser));
  }

  @override
  User? get currentUser => _mapFirebaseUserToUser(_auth.currentUser);

  User? _mapFirebaseUserToUser(firebase.User? firebaseUser) {
    if (firebaseUser == null) return null;
    return User(userID: firebaseUser.uid);
  }
}
