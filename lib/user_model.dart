import 'package:flutter/cupertino.dart';
import 'package:flutter_inheritedwidget/user.dart';

class UserModel extends InheritedModel<User> {
  final User? user;

  const UserModel({super.key, required super.child, this.user});

  static User? of(BuildContext context) {
    return InheritedModel.inheritFrom<UserModel>(context)!.user;
  }

  @override
  bool updateShouldNotify(UserModel oldWidget) {
    return user != oldWidget.user;
  }

  @override
  bool updateShouldNotifyDependent(
      UserModel oldWidget, Set<User> dependencies) {
    return user != oldWidget.user && dependencies.contains(user);
  }
}