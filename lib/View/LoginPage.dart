import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../ViewModel/LoginViewModel.dart';
import 'ChatPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageViewModel _viewModel = LoginPageViewModel();
  bool _isSignup = true;

  Future<void> _authUser() async {
    if (_isSignup) {
      await _viewModel.registerUser(context);
    } else {
      await _viewModel.loginUser(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_isSignup ? 'Signup!' : 'Login!', style: const TextStyle(fontSize: 32)),

              const SizedBox(height: 32),

              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    _viewModel.email = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _viewModel.password = value;
                  });
                },
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [TextButton(onPressed: (){
                  setState(() {
                    _isSignup = !_isSignup;
                  });
                }, child: Text('here is ${_isSignup ? 'Login' : 'Signup'}'))]
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(8),
                child: Text(_viewModel.errorText),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(_isSignup ? 'ユーザー登録' : 'ログイン'),
                  onPressed: () async {
                    _authUser();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}