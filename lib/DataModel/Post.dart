import '../Database/Database.dart';
import 'package:uuid/uuid.dart';

class Post extends Entity {
  final String id;
  final String email;
  final String text;
  final String time;

  Post({required this.id, required this.email, required this.text, required this.time});

  static String provideID() {
    return const Uuid().v4();
  }
}
