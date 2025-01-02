class AppUser {
  String userID;
  String username;
  String firstName;
  String lastName;
  String? profilePicURL;

  AppUser({
    required this.userID,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.profilePicURL,
  });

  /// Erstellt einen [AppUser] aus einer [Map].
  ///
  /// Die Map [userData] muss die folgenden Schlüssel enthalten:
  /// - `userID`: Die eindeutige Benutzer-ID.
  /// - `username`: Der Benutzername.
  /// - `firstName`: Der Vorname.
  /// - `lastName`: Der Nachname.
  /// - `profilePicURL`: (optional) Die URL des Profilbildes.
  factory AppUser.fromMap(Map<String, dynamic> userData) {
    return AppUser(
      userID: userData['userID'],
      username: userData['username'],
      firstName: userData['firstName'],
      lastName: userData['lastName'],
      profilePicURL: userData['profilePicURL'],
    );
  }

  /// Konvertiert den [AppUser] in eine [Map].
  ///
  /// Gibt eine Map zurück, die folgende Schlüssel enthält:
  /// - `userID`: Die eindeutige Benutzer-ID.
  /// - `username`: Der Benutzername.
  /// - `firstName`: Der Vorname.
  /// - `lastName`: Der Nachname.
  /// - `profilePicURL`: (optional) Die URL des Profilbildes.
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicURL': profilePicURL,
    };
  }
}
