import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_field_error_provider.g.dart';

@riverpod
class TextFieldErrorNotifier extends _$TextFieldErrorNotifier {
  @override
  String? build(String id) {
    return null;
  }

  void setError(String? error) {
    state = error;
  }
}
