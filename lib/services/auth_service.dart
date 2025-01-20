import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:dart_chat/models/user.dart';

/// Possible Exceptions, all of which are subclasses of [AuthException]:
/// - [InvalidEmailException]
/// - [NetworkRequestFailedException]
/// - [UserTokenExpiredException]
/// - [UnknownAuthException]
abstract class AuthService {
  /// Possible Exceptions, in addition to those declared for [AuthService]:
  /// - [EmailAlreadyInUseException]
  /// - [WeakPasswordException]
  Future<User?> registerWithEmail(String email, String password);

  /// Possible Exceptions, in addition to those declared for [AuthService]:
  /// - [UserNotFoundException]
  /// - [WrongPasswordException]
  Future<User?> signInWithEmail(String email, String password);

  /// If successful, it also updates any [authStateChanges] stream listeners.
  Future<void> signOut();

  /// Stream of [User.userID]
  Stream<User?> authStateChanges();

  User? get currentUserID;
}
