import 'package:dart_chat/models/user.dart';
import 'package:dart_chat/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  @override
  Future<User?> loadUserbyID(String userID) {
    // TODO: implement loadUserbyID
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
