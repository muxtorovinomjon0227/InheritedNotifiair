import 'package:flutter/cupertino.dart';
import 'package:flutter_inheritedwidget/user.dart';

class UserStateNotifier extends InheritedNotifier<UserState>{
  const UserStateNotifier({super.key,required UserState userState, required super.child}):super(notifier: userState);

  static User? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<UserStateNotifier>()?.notifier?.user;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<UserState> oldWidget) {
    return notifier!.user != oldWidget.notifier!.user;
  }

}