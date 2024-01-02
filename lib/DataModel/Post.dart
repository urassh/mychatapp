import '../Database/Database.dart';

class Post extends Entity {
  final String email;
  final String text;
  final String time;

  Post(this.email, this.text, this.time);
}
