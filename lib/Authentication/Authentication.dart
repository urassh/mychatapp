import 'package:mychatapp/DataModel/User.dart';

abstract class Authentication {
  Future<User?> register(String email, String password) async {

  }

  Future<User?> login(String email, String password) async {

  }
}