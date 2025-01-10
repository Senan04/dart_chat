class User {
  String userID;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePicURL;

  User({
    required this.userID,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePicURL,
  });

  factory User.fromMap(Map<String, dynamic> userData) {
    return User(
      userID: userData['userID'] as String,
      username: userData['username'] as String?,
      firstName: userData['firstName'] as String?,
      lastName: userData['lastName'] as String?,
      profilePicURL: userData['profilePicURL'] as String?,
    );
  }

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
