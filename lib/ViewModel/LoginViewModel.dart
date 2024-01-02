import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
import 'package:mychatapp/Authentication/AuthFirebase.dart';
import '../Authentication/AuthDummy.dart';
import '../View/ChatPage.dart';
// ignore: library_prefixes
import 'package:mychatapp/DataModel/User.dart' as MyUser;

class LoginPageViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String errorText = '';
  Authentication auth = AuthFirebase();
  MyUser.User? sessionUser;

  Future<void> registerUser(BuildContext context) async {
    try {
      sessionUser = auth.register(email, password) as MyUser.User?;
      _navigateToChatPage(context);
    } catch (e) {
      errorText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      sessionUser = auth.login(email, password) as MyUser.User?;
      _navigateToChatPage(context);
    } catch (e) {
      errorText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> _navigateToChatPage(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return ChatPage();
      }),
    );
  }
}