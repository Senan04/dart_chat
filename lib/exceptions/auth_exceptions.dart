class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException() : super('Email is already in use');
}

class InvalidEmailException extends AuthException {
  InvalidEmailException() : super('Invalid Email. Please try another.');
}

class WeakPasswordException extends AuthException {
  WeakPasswordException() : super('Weak password. Please try another.');
}

class WrongPasswordException extends AuthException {
  WrongPasswordException() : super('Wrong password.');
}

class UserNotFoundException extends AuthException {
  UserNotFoundException() : super('User was not found.');
}

class UserTokenExpiredException extends AuthException {
  UserTokenExpiredException() : super('Authentication expired');
}

class NetworkRequestFailedException extends AuthException {
  NetworkRequestFailedException()
      : super(
            'Network request error. Please check your internet connection and try again.');
}

class UnknownAuthException extends AuthException {
  UnknownAuthException(super.message);
}
