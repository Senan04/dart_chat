import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_field_state_provider.g.dart';

@riverpod
class TextFieldStateNotifier extends _$TextFieldStateNotifier {
  @override
  ({String? text, String? error}) build(String id) {
    return (text: null, error: null);
  }

  void setText(String? text) {
    state = (text: text, error: state.error);
    print(state);
  }

  void setError(String? error) {
    state = (text: state.text, error: error);
    print(state);
  }
}
