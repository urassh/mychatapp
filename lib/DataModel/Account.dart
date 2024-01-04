import 'package:firebase_auth/firebase_auth.dart';

class Account {
  String email;
  String password = '';

  Account({required this.email, this.password = ''});

  static Account convertFromFirebase (UserCredential userCredential) {
    Account firebaseUser = userCredential.user! as Account;
    return Account(email: firebaseUser.email);
  }
}