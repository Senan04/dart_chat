// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_validator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authFormValidator)
const authFormValidatorProvider = AuthFormValidatorProvider._();

final class AuthFormValidatorProvider
    extends
        $FunctionalProvider<
          AuthFormValidator,
          AuthFormValidator,
          AuthFormValidator
        >
    with $Provider<AuthFormValidator> {
  const AuthFormValidatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authFormValidatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authFormValidatorHash();

  @$internal
  @override
  $ProviderElement<AuthFormValidator> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthFormValidator create(Ref ref) {
    return authFormValidator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthFormValidator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthFormValidator>(value),
    );
  }
}

String _$authFormValidatorHash() => r'85bbf2f7811f7b2a7ae32a7ca82cb1c21c327873';
