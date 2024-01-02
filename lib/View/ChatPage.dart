import 'package:flutter/material.dart';
import 'package:mychatapp/DataModel/Account.dart';
import 'package:mychatapp/ViewModel/ChatViewModel.dart';
import 'AddPostPage.dart';

class ChatPage extends StatelessWidget {
  ChatPage(this.user, {super.key});
  final ChatViewModel viewModel = ChatViewModel();
  final Account user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await viewModel.logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('ログイン情報：${user.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // 投稿画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AddPostPage();
            }),
          );
        },
      ),
    );
  }
}