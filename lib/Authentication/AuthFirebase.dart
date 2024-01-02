import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
import '../DataModel/Account.dart';

class AuthFirebase implements Authentication {

  @override
  Future<Account?> register(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      return null;
    }

    return Account(email: '${userCredential.user!.email}');
  }

  @override
  Future<Account?> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    if (userCredential.user == null) {
      return null;
    }

    return Account(email: '${userCredential.user!.email}');
  }

  @override
  Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
  }
}
