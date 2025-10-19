// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TextFieldStateNotifier)
const textFieldStateProvider = TextFieldStateNotifierFamily._();

final class TextFieldStateNotifierProvider
    extends
        $NotifierProvider<
          TextFieldStateNotifier,
          ({String? error, String? text})
        > {
  const TextFieldStateNotifierProvider._({
    required TextFieldStateNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'textFieldStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$textFieldStateNotifierHash();

  @override
  String toString() {
    return r'textFieldStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TextFieldStateNotifier create() => TextFieldStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({String? error, String? text}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({String? error, String? text})>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TextFieldStateNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textFieldStateNotifierHash() =>
    r'ba0c38d2ec139a0b2380f4c8fd019cc5037bbddc';

final class TextFieldStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TextFieldStateNotifier,
          ({String? error, String? text}),
          ({String? error, String? text}),
          ({String? error, String? text}),
          String
        > {
  const TextFieldStateNotifierFamily._()
    : super(
        retry: null,
        name: r'textFieldStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TextFieldStateNotifierProvider call(String id) =>
      TextFieldStateNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'textFieldStateProvider';
}

abstract class _$TextFieldStateNotifier
    extends $Notifier<({String? error, String? text})> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  ({String? error, String? text}) build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              ({String? error, String? text}),
              ({String? error, String? text})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({String? error, String? text}),
                ({String? error, String? text})
              >,
              ({String? error, String? text}),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
