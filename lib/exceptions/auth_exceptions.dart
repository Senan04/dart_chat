class EmailAlreadyInUseException implements Exception {
  String message;
  EmailAlreadyInUseException(this.message);
}

class InvalidEmailException implements Exception {
  String message;
  InvalidEmailException(this.message);
}

class WeakPasswordException implements Exception {
  String message;
  WeakPasswordException(this.message);
}

class UserTokenExpiredException implements Exception {
  String message;
  UserTokenExpiredException(this.message);
}

class NetworkRequestFailedException implements Exception {
  String message;
  NetworkRequestFailedException(this.message);
}
