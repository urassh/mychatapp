import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  late String newUserEmail;
  late String newUserPassword;
  late String infoText;

  AuthController() {
    newUserEmail = "";
    newUserPassword = "";
    infoText = "";
  }

  Future<void> registerUser() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: newUserEmail,
        password: newUserPassword,
      );

      final User user = result.user!;

    } catch (e) {
      infoText = "登録NG：${e.toString()}";
    }
  }
}