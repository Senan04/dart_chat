import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:dart_chat/models/user.dart';

abstract class AuthService {
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
  Future<User?> registerWithEmail(String email, String password);

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
  Future<User?> signInWithEmail(String email, String password);

  /// Signs out the current user.
  ///
  /// If successful, it also updates any [authStateChanges] stream listeners.
  Future<void> signOut();

  /// Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
  Stream<User?> authStateChanges();

  User? get currentUser;
}
