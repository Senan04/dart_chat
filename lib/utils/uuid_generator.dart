import 'package:uuid/uuid.dart';

class UuidGenerator {
  static final uuid = const Uuid();

  static String newID() {
    return uuid.v4();
  }
}
