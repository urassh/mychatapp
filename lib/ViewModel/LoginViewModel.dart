import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/Authentication.dart';
import 'package:mychatapp/Authentication/Session.dart';
import 'package:mychatapp/administration.dart';
import '../DataModel/User.dart';
import '../View/ChatPage.dart';

class LoginPageViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String errorText = '';
  final Authentication _auth = Services.authentication;
  final Session session = Session();

  Future<void> registerUser(BuildContext context) async {
    try {
      User? account = await _auth.register(email, password);
      await session.setAuthenticatedUser(account!);
      // ignore: use_build_context_synchronously
      await _navigateToChatPage(context);
    } catch (e) {
      errorText = "登録に失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      User? account = await _auth.login(email, password);
      session.setAuthenticatedUser(account!);
      // ignore: use_build_context_synchronously
      _navigateToChatPage(context);
    } catch (e) {
      errorText = "ログインに失敗しました：${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> _navigateToChatPage(BuildContext context) async {
    if (!session.isUserAuthenticated()) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return const ChatPage();
      }),
    );
  }
}