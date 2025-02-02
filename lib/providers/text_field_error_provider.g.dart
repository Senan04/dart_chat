// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textFieldErrorNotifierHash() =>
    r'bfc7e3c6fd87b8c5f58817fcf2df270a59dd7109';

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

abstract class _$TextFieldErrorNotifier
    extends BuildlessAutoDisposeNotifier<String?> {
  late final String id;

  String? build(
    String id,
  );
}

/// See also [TextFieldErrorNotifier].
@ProviderFor(TextFieldErrorNotifier)
const textFieldErrorNotifierProvider = TextFieldErrorNotifierFamily();

/// See also [TextFieldErrorNotifier].
class TextFieldErrorNotifierFamily extends Family<String?> {
  /// See also [TextFieldErrorNotifier].
  const TextFieldErrorNotifierFamily();

  /// See also [TextFieldErrorNotifier].
  TextFieldErrorNotifierProvider call(
    String id,
  ) {
    return TextFieldErrorNotifierProvider(
      id,
    );
  }

  @override
  TextFieldErrorNotifierProvider getProviderOverride(
    covariant TextFieldErrorNotifierProvider provider,
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
  String? get name => r'textFieldErrorNotifierProvider';
}

/// See also [TextFieldErrorNotifier].
class TextFieldErrorNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TextFieldErrorNotifier, String?> {
  /// See also [TextFieldErrorNotifier].
  TextFieldErrorNotifierProvider(
    String id,
  ) : this._internal(
          () => TextFieldErrorNotifier()..id = id,
          from: textFieldErrorNotifierProvider,
          name: r'textFieldErrorNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textFieldErrorNotifierHash,
          dependencies: TextFieldErrorNotifierFamily._dependencies,
          allTransitiveDependencies:
              TextFieldErrorNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  TextFieldErrorNotifierProvider._internal(
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
  String? runNotifierBuild(
    covariant TextFieldErrorNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TextFieldErrorNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextFieldErrorNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<TextFieldErrorNotifier, String?>
      createElement() {
    return _TextFieldErrorNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextFieldErrorNotifierProvider && other.id == id;
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
mixin TextFieldErrorNotifierRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TextFieldErrorNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TextFieldErrorNotifier, String?>
    with TextFieldErrorNotifierRef {
  _TextFieldErrorNotifierProviderElement(super.provider);

  @override
  String get id => (origin as TextFieldErrorNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
