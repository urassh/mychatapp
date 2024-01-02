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
  final Authentication _auth = AuthFirebase();
  MyUser.User? _sessionUser;

  Future<void> registerUser(BuildContext context) async {
    try {
      _sessionUser = _auth.register(email, password) as MyUser.User?;
      _navigateToChatPage(context);
    } catch (e) {
      errorText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      _sessionUser = _auth.login(email, password) as MyUser.User?;
      _navigateToChatPage(context);
    } catch (e) {
      errorText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> _navigateToChatPage(BuildContext context) async {
    if (_sessionUser == null) {
      return ;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return ChatPage(_sessionUser!);
      }),
    );
  }
}