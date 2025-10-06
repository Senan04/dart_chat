import 'package:dart_chat/utils/auth_form_validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_form_validator_provider.g.dart';

@riverpod
AuthFormValidator authFormValidator(Ref ref) {
  return AuthFormValidator(ref);
}
