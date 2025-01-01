class EmailAlreadyInUseException implements Exception {
  @override
  String toString() => 'Email is already in use';
}

class InvalidEmailException implements Exception {
  @override
  String toString() => 'Invalid Email. Please try another.';
}

class WeakPasswordException implements Exception {
  @override
  String toString() => 'Weak password. Please try another.';
}

class UserTokenExpiredException implements Exception {
  @override
  String toString() => 'Authentication expired';
}

class NetworkRequestFailedException implements Exception {
  @override
  String toString() =>
      'Network request error. Please check your internet connection and try again.';
}
