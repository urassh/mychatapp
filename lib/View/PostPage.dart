import 'package:flutter/material.dart';
import 'package:mychatapp/DataModel/Post.dart';
import 'package:mychatapp/ViewModel/PostViewModel.dart';
import '../Authentication/Session.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  PostPageState createState() {
    return PostPageState();
  }
}

class PostPageState extends State<PostPage> {
  String messageText = '';

  @override
  Widget build(BuildContext context) {
    PostViewModel viewModel = PostViewModel(context);
    Session session = Session();

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット投稿'),
      ),
      body: Center(
       child: Container(
         padding: const EdgeInsets.all(32),
         child: Column(
           children: <Widget>[
             TextFormField(
               decoration: const InputDecoration(labelText: '投稿メッセージ'),
               keyboardType: TextInputType.multiline,
               maxLines: 3,
               onChanged: (String value) {
                 setState(() {
                   messageText = value;
                 });
               },
             ),

             const SizedBox(height: 8),

             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 child: const Text('投稿'),
                 onPressed: () async {
                   final postID = Post.provideID();
                   final email  = session.authenticatedUser.email;
                   final time   = DateTime.now().toLocal().toIso8601String();

                   final post = Post(id: postID, email: email, text: messageText, time: time);

                   viewModel.post(post);
                   viewModel.navigateToChatPage();
                 },
               ),
             ),

             const SizedBox(height: 8),

             TextButton(onPressed: () {
              viewModel.navigateToChatPage();
             }, child: const Text('chatView'))
           ],
         ),
       ),
      ),
    );
  }
}