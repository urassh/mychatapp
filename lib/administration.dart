import 'package:mychatapp/Authentication/AuthDummy.dart';
import 'package:mychatapp/Authentication/AuthFirebase.dart';
import 'package:mychatapp/Database/DummyDatabase.dart';
import 'package:mychatapp/Database/FirebaseDatabase.dart';
import 'Authentication/Authentication.dart';
import 'Database/Database.dart';

class Services {
  static final Authentication authentication = AuthFirebase();
  static final Database database = FirebaseDatabase();
}