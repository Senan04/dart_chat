import 'package:dart_chat/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<String?> register(String email, String password) async {
    return await _authService.registerWithEmail(email, password);
  }

  Future<String?> login(String email, String password) async {
    return await _authService.signInWithEmail(email, password);
  }

  Future<void> logout() async {
    await _authService.signOut();
  }

  Stream<String?> authStateChanges() {
    return _authService.authStateChanges();
  }
}
