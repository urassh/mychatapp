import 'package:flutter/material.dart';
import 'package:mychatapp/DataModel/Account.dart';
import 'package:mychatapp/ViewModel/ChatViewModel.dart';
import 'PostPage.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatViewModel viewModel = ChatViewModel(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await viewModel.logout();
              await viewModel.navigateToLoginPage();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('ログイン情報：${viewModel.session.authenticatedUser.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await viewModel.navigateToAddPostPage();
        },
      ),
    );
  }
}