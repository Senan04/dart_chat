// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierFamily._();

final class AuthNotifierProvider
    extends $NotifierProvider<AuthNotifier, AuthState> {
  const AuthNotifierProvider._({
    required AuthNotifierFamily super.from,
    required AuthRepository super.argument,
  }) : super(
         retry: null,
         name: r'authProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @override
  String toString() {
    return r'authProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authNotifierHash() => r'2314dea480d073035fdfa0c3d20673eeae2bcfb4';

final class AuthNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AuthNotifier,
          AuthState,
          AuthState,
          AuthState,
          AuthRepository
        > {
  const AuthNotifierFamily._()
    : super(
        retry: null,
        name: r'authProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthNotifierProvider call(AuthRepository authRepository) =>
      AuthNotifierProvider._(argument: authRepository, from: this);

  @override
  String toString() => r'authProvider';
}

abstract class _$AuthNotifier extends $Notifier<AuthState> {
  late final _$args = ref.$arg as AuthRepository;
  AuthRepository get authRepository => _$args;

  AuthState build(AuthRepository authRepository);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
