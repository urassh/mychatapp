import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/AuthDummy.dart';

import '../Authentication/AuthFirebase.dart';
import '../Authentication/Authentication.dart';
import '../View/LoginPage.dart';

class ChatViewModel extends ChangeNotifier {
  final Authentication _auth = AuthFirebase();

  Future<void> logout(BuildContext context) async {
    await _auth.logout();
    // ignore: use_build_context_synchronously
    await _navigateToChatPage(context);
  }

  Future<void> _navigateToChatPage(BuildContext context) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }),
    );
  }
}