import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
import '../DataModel/User.dart' as AppUser;

class AuthFirebase implements Authentication {

  @override
  Future<AppUser.User?> register(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      return null;
    }

    return AppUser.User(email: '${userCredential.user!.email}');
  }

  @override
  Future<AppUser.User?> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    if (userCredential.user == null) {
      return null;
    }

    return AppUser.User(email: '${userCredential.user!.email}');
  }

  @override
  Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
  }
}
