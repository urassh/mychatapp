import 'package:flutter/material.dart';
import 'package:mychatapp/View/ChatPage.dart';

class PostViewModel extends ChangeNotifier {
  final BuildContext context;

  PostViewModel(this.context);

  Future<void> navigateToChatPage() async {
    _navigateToPages(const ChatPage());
  }

  Future<void> _navigateToPages(Widget widget) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
    );
  }
}