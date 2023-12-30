import 'package:flutter/material.dart';
import 'AuthController.dart';

class MyAuthPage extends StatefulWidget {
  const MyAuthPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAuthPageState();
  }

}

class _MyAuthPageState extends State<MyAuthPage> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    _authController.newUserEmail = value;
                  });
                },
              ),

              const SizedBox(height: 8),

              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード（６文字以上）"),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _authController.newUserPassword = value;
                  });
                },
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () async {
                  await _authController.registerUser();
                  setState(() {});
                },
                child: const Text("ユーザー登録"),
              ),

              const SizedBox(height: 8),

              Text(_authController.infoText),
            ],
          ),
        ),
      ),
    );
  }

}