import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychatapp/Authentication/Authentication.dart';

class AuthFirebase implements Authentication {

  @override
  Future<void> register(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }
}