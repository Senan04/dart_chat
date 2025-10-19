class AuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final String? error;
  final String? userId;

  const AuthState({
    this.isLoggedIn = false,
    this.isLoading = false,
    this.error,
    this.userId,
  });

  // copyWith ist essenziell für StateNotifier
  AuthState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    String? error,
    String? userId,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      error: error, // Fehler explizit setzen (auch auf null)
      userId: userId ?? this.userId,
    );
  }

  // Ein Initialzustand
  static const initial = AuthState();
}
