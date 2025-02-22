import 'package:dart_chat/models/user.dart';
import 'package:dart_chat/services/database_service.dart';

class UserRepository {
  final DatabaseService _databaseService;

  static const String usersCollectionPath = 'users';

  User? _currentUser;

  UserRepository(this._databaseService);

  User? get currentUser => _currentUser;

  set currentUser(User? newUser) => _currentUser = newUser;

  Future<User?> loadUserbyID(String userID) async {
    final userData = await _databaseService.getDocument(
      collectionPath: usersCollectionPath,
      docPath: userID,
    );

    return userData != null ? User.fromJson(userData) : null;
  }

  Future<void> saveUser(User user) async {
    final data = user.toJson();

    await _databaseService.addDocument(
      data: data,
      collectionPath: usersCollectionPath,
      docPath: user.userID,
    );
  }
}
