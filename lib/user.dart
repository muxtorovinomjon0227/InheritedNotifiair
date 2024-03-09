import 'package:flutter/cupertino.dart';

class User {
  String? name;
  String? age;

  User({this.name = "", this.age = ''});
}

class UserState extends ChangeNotifier {
  User _user = User();
  User get user => _user;

  void setProfile(User updateProfile) {
    _user = updateProfile;
    notifyListeners();
  }
}
