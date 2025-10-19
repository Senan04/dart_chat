// class AuthNotifier extends StateNotifier<AuthState> {
//   final AuthRepository _authRepository;

//   // StreamSubscription, um das Abonnement sauber zu verwalten und zu schließen
//   late final StreamSubscription<String?> _authStateSubscription;

//   AuthNotifier(this._authRepository) : super(AuthState.initial) {
//     // 2. Stream-Abonnement: Prüfe den Anmeldestatus beim Start und bei Änderungen
//     _authStateSubscription = _authRepository.authStateChanges().listen((userId) {
//       // Wenn eine UID vorhanden ist, ist der Benutzer angemeldet
//       if (userId != null) {
//         _handleUserSignedIn(userId);
//       } else {
//         _handleUserSignedOut();
//       }
//     });
//   }

//   // Interne Helferfunktion: Wird bei erfolgreichem Stream-Event ausgelöst
//   void _handleUserSignedIn(String userId) {
//     state = state.copyWith(
//       isLoggedIn: true,
//       userId: userId,
//       error: null,
//       isLoading: false,
//     );

//     // HINWEIS: Hier würdest du typischerweise dein volles User-Profil über
//     // das UserRepository laden, aber das behandeln wir später.
//   }

//   // Interne Helferfunktion: Wird bei ausgeloggtem Stream-Event ausgelöst (null)
//   void _handleUserSignedOut() {
//     state = AuthState.initial; // Zurücksetzen auf den Anfangszustand
//   }

//   // Logik-Methode: Login
//   Future<void> signIn(String email, String password) async {
//     state = state.copyWith(isLoading: true, error: null);
//     try {
//       await _authRepository.signInWithEmail(email, password);
//       // HINWEIS: Wenn signIn erfolgreich ist, wird der Stream-Listener (_authStateSubscription)
//       // automatisch feuern und _handleUserSignedIn aufrufen.
//     } on AuthException catch (e) {
//       state = state.copyWith(isLoading: false, error: e.message);
//     }
//   }

//   // Logik-Methode: Registrierung
//   Future<void> register(String email, String password, String name) async {
//     state = state.copyWith(isLoading: true, error: null);
//     try {
//       final userId = await _authRepository.registerWithEmail(email, password);

//       // HINWEIS: Hier *müsste* die Koordination mit dem UserRepository erfolgen,
//       // um das Firestore-Profil zu erstellen.
//       // await _userRepository.createUserProfile(userId, name);

//       // Der Stream feuert und updated den Zustand.
//     } on AuthException catch (e) {
//       state = state.copyWith(isLoading: false, error: e.message);
//     }
//   }

//   // Logik-Methode: Logout
//   Future<void> signOut() async {
//     await _authRepository.signOut();
//     // Der Stream feuert automatisch _handleUserSignedOut
//   }

//   // Wichtig: Schließe das Stream-Abonnement, wenn der Notifier verworfen wird
//   @override
//   void dispose() {
//     _authStateSubscription.cancel();
//     super.dispose();
//   }
// }
import 'dart:async';

import 'package:dart_chat/auth_state.dart';
import 'package:dart_chat/exceptions/auth_exceptions.dart';
import 'package:dart_chat/providers/repository_providers/auth_repository_provider.dart';
import 'package:dart_chat/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authRepository;

  //late final StreamSubscription<String?> _authStateSubscription;

  @override
  AuthState build(AuthRepository authRepository) {
    _authRepository = ref.read(authRepositoryProvider);

    StreamSubscription<String?> authStateSubscription = _authRepository
        .authStateChanges()
        .listen((userID) {
          if (userID != null) {
            _handleUserSignedIn(userID);
          } else {
            _handleUserSignedOut();
          }
        });

    ref.onDispose(authStateSubscription.cancel);

    return AuthState.initial;
  }

  // Interne Helferfunktion: Wird bei erfolgreichem Stream-Event ausgelöst
  void _handleUserSignedIn(String userId) {
    state = state.copyWith(
      isLoggedIn: true,
      userId: userId,
      error: null,
      isLoading: false,
    );

    // HINWEIS: Hier würdest du typischerweise dein volles User-Profil über
    // das UserRepository laden, aber das behandeln wir später.
  }

  // Interne Helferfunktion: Wird bei ausgeloggtem Stream-Event ausgelöst (null)
  void _handleUserSignedOut() {
    state = AuthState.initial; // Zurücksetzen auf den Anfangszustand
  }

  // Logik-Methode: Login
  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _authRepository.signInWithEmail(email, password);
      // HINWEIS: Wenn signIn erfolgreich ist, wird der Stream-Listener (_authStateSubscription)
      // automatisch feuern und _handleUserSignedIn aufrufen.
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    }
  }

  // Logik-Methode: Registrierung
  Future<void> register(String email, String password, String name) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userId = await _authRepository.registerWithEmail(email, password);

      // HINWEIS: Hier *müsste* die Koordination mit dem UserRepository erfolgen,
      // um das Firestore-Profil zu erstellen.
      // await _userRepository.createUserProfile(userId, name);

      // Der Stream feuert und updated den Zustand.
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    }
  }

  // Logik-Methode: Logout
  Future<void> signOut() async {
    await _authRepository.signOut();
    // Der Stream feuert automatisch _handleUserSignedOut
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
