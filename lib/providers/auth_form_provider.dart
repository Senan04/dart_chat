import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_form_provider.g.dart';

class FormState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;

  FormState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
  });

  FormState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return FormState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}

@riverpod
class FormNotifier extends _$FormNotifier {
  @override
  FormState build() => FormState();

  void updatePassword(String password) {
    state = state.copyWith(
      password: password,
      passwordError: _validatePassword(password),
    );
  }

  void updateEmail(String email) {
    state = state.copyWith(
      email: email,
      emailError: _validateEmail(email),
    );
  }

  String? _validatePassword(String password) {
    final minLength = 8;
    final requirements = RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)$');

    if (password.length < minLength) {
      return 'Password must be at least 6 characters long.';
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
