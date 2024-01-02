import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
// ignore: library_prefixes
import 'package:mychatapp/DataModel/User.dart' as MyUser;

class AuthFirebase implements Authentication {

  @override
  Future<MyUser.User?> register(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      return null;
    }

    return MyUser.User(email: '${userCredential.user!.email}');
  }

  @override
  Future<MyUser.User?> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    if (userCredential.user == null) {
      return null;
    }

    return MyUser.User(email: '${userCredential.user!.email}');
  }

  @override
  Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
  }
}
