import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
import 'package:mychatapp/Authentication/AuthFirebase.dart';
import '../Authentication/AuthDummy.dart';
import '../View/ChatPage.dart';

class LoginPageViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String infoText = '';
  Authentication auth = AuthDummy();

  Future<void> registerUser(BuildContext context) async {
    try {
      auth.register(email, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return ChatPage();
        }),
      );
    } catch (e) {
      infoText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }
}