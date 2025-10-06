import 'package:dart_chat/providers/text_field_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFormValidator {
  final Ref ref;

  AuthFormValidator(this.ref);

  String? validatePassword(String password, String? textFieldID) {
    String? error = _validatePassword(password);

    if (textFieldID != null) {
      ref.read(textFieldStateProvider(textFieldID).notifier).setError(error);
    }

    return error;
  }

  String? validateEmail(String email, String? textFieldID) {
    String? error = _validateEmail(email);

    if (textFieldID != null) {
      ref.read(textFieldStateProvider(textFieldID).notifier).setError(error);
    }

    return error;
  }

  String? _validatePassword(String password) {
    final minLength = 8;
    final requirements =
        RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,}$');

    if (password.length < minLength) {
      return 'Password must be at least $minLength characters long.';
    }

    if (!requirements.hasMatch(password)) {
      return 'Password must contain at least: one digit, one lowercase letter, one uppercase letter, one special character';
    }

    return null;
  }

  String? _validateEmail(String email) {
    RegExp requirements = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

    if (!requirements.hasMatch(email)) {
      return 'Please enter a valid email adress.';
    }

    return null;
  }
}
