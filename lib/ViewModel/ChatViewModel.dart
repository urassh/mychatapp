import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/AuthDummy.dart';
import 'package:mychatapp/View/PostPage.dart';

import '../Authentication/AuthFirebase.dart';
import '../Authentication/Authentication.dart';
import '../Authentication/Session.dart';
import '../View/LoginPage.dart';

class ChatViewModel extends ChangeNotifier {
  final Authentication _auth = AuthFirebase();
  final BuildContext context;
  final Session session = Session();

  ChatViewModel(this.context);

  Future<void> logout() async {
    await _auth.logout();
    session.destroySession();
  }

  Future<void> navigateToLoginPage() async {
    _navigateToPages(const LoginPage());
  }

  Future<void> navigateToAddPostPage() async {
    _navigateToPages(const PostPage());
  }

  Future<void> _navigateToPages(Widget widget) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
    );
  }
}