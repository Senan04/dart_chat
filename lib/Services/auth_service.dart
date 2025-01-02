import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Registers a new user with the provided `email` and `password`.
  ///
  /// Throws specific exceptions, all of which are subclasses of [AuthException], for common authentication errors:
  /// - [EmailAlreadyInUseException]: If the email is already registered.
  /// - [InvalidEmailException]: If the provided email format is invalid.
  /// - [WeakPasswordException]: If the password is too weak.
  /// - [NetworkRequestFailedException]: If a network request fails.
  /// - [UserTokenExpiredException]: If the user's token has expired.
  /// - [UnknownAuthException]: For unknown or unexpected authentication errors.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [User] object if registration is successful.
  /// - `null` if the user registration fails unexpectedly.
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
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

  /// Signs a user in using their `email` and `password`.
  ///
  /// Throws specific exceptions, all of which are subclasses of [AuthException], for common authentication errors:
  /// - [InvalidEmailException]: If the provided email format is invalid.
  /// - [NetworkRequestFailedException]: If a network request fails.
  /// - [UserTokenExpiredException]: If the user's token has expired.
  /// - [UserNotFoundException] : If there is no user corresponding to the given email.
  /// - [WrongPasswordException] : If the password is invalid for the given email, or the account corresponding to the email does not have a password set.
  /// - [UnknownAuthException]: For unknown or unexpected authentication errors.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [User] object if succesfully signed in.
  /// - `null` if the user registration fails unexpectedly.
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
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

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
