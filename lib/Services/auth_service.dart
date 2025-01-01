import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  /// Registers a user using their email and password.
  ///
  /// This method interacts with Firebase to create a new user account
  /// and returns the registered [User] object upon success.
  ///
  /// Throws specific exceptions, all of which are subclasses of [AuthException], for common authentication errors:
  /// - [EmailAlreadyInUseException]: If the email is already registered.
  /// - [InvalidEmailException]: If the provided email format is invalid.
  /// - [WeakPasswordException]: If the password is too weak.
  /// - [NetworkRequestFailedException]: If a network request fails.
  /// - [UserTokenExpiredException]: If the user's token has expired.
  /// - [UnknownAuthException]: For unknown, unexpected or uncovered Firebase authentication errors.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [User] object if registration is successful.
  /// - `null` if the user registration fails unexpectedly.
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
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

  /// Signs a user in to their account using their email and password.
  ///
  /// This method interacts with Firebase to sign an existing user in to their account
  /// and returns the registered [User] object upon success.
  ///
  /// Throws specific exceptions, all of which are subclasses of [AuthException], for common authentication errors:
  /// - [InvalidEmailException]: If the provided email format is invalid.
  /// - [NetworkRequestFailedException]: If a network request fails.
  /// - [UserTokenExpiredException]: If the user's token has expired.
  /// - [UserNotFoundException] : If there is no user corresponding to the given email.
  /// - [WrongPasswordException] : If the password is invalid for the given email, or the account corresponding to the email does not have a password set.
  /// - [UnknownAuthException]: For unknown, unexpected or uncovered Firebase authentication errors.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [User] object if registration is successful.
  /// - `null` if the user registration fails unexpectedly.
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredentials = await _firebase.signInWithEmailAndPassword(
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
}
