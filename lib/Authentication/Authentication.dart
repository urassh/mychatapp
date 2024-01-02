import 'package:mychatapp/DataModel/Account.dart';

abstract class Authentication {
  Future<Account?> register(String email, String password) async {

  }

  Future<Account?> login(String email, String password) async {

  }

  Future<void> logout() async {

  }
}