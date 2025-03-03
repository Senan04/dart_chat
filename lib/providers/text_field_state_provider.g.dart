// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textFieldStateNotifierHash() =>
    r'289a06a2ee2da0417f8b21fa6b0483a241fa03c6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TextFieldStateNotifier
    extends BuildlessAutoDisposeNotifier<({String? text, String? error})> {
  late final String id;

  ({String? text, String? error}) build(
    String id,
  );
}

/// See also [TextFieldStateNotifier].
@ProviderFor(TextFieldStateNotifier)
const textFieldStateNotifierProvider = TextFieldStateNotifierFamily();

/// See also [TextFieldStateNotifier].
class TextFieldStateNotifierFamily
    extends Family<({String? text, String? error})> {
  /// See also [TextFieldStateNotifier].
  const TextFieldStateNotifierFamily();

  /// See also [TextFieldStateNotifier].
  TextFieldStateNotifierProvider call(
    String id,
  ) {
    return TextFieldStateNotifierProvider(
      id,
    );
  }

  @override
  TextFieldStateNotifierProvider getProviderOverride(
    covariant TextFieldStateNotifierProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'textFieldStateNotifierProvider';
}

/// See also [TextFieldStateNotifier].
class TextFieldStateNotifierProvider extends AutoDisposeNotifierProviderImpl<
    TextFieldStateNotifier, ({String? text, String? error})> {
  /// See also [TextFieldStateNotifier].
  TextFieldStateNotifierProvider(
    String id,
  ) : this._internal(
          () => TextFieldStateNotifier()..id = id,
          from: textFieldStateNotifierProvider,
          name: r'textFieldStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textFieldStateNotifierHash,
          dependencies: TextFieldStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              TextFieldStateNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  TextFieldStateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  ({String? text, String? error}) runNotifierBuild(
    covariant TextFieldStateNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TextFieldStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextFieldStateNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TextFieldStateNotifier,
      ({String? text, String? error})> createElement() {
    return _TextFieldStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextFieldStateNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TextFieldStateNotifierRef
    on AutoDisposeNotifierProviderRef<({String? text, String? error})> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TextFieldStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TextFieldStateNotifier,
        ({String? text, String? error})> with TextFieldStateNotifierRef {
  _TextFieldStateNotifierProviderElement(super.provider);

  @override
  String get id => (origin as TextFieldStateNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
