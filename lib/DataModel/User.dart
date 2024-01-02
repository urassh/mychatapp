import 'package:firebase_auth/firebase_auth.dart';

class User {
  late String email;
  late String password = '';

  User({required this.email, this.password = ''});

  static User convertFromFirebase (UserCredential userCredential) {
    User firebaseUser = userCredential.user! as User;
    return User(email: firebaseUser.email);
  }
}