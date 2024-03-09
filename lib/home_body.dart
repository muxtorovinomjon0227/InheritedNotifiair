import 'package:flutter/cupertino.dart';
import 'package:flutter_inheritedwidget/user.dart';
import 'package:flutter_inheritedwidget/user_model.dart';

class HomeBody extends StatelessWidget {
 final User user;
   const HomeBody({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: UserModel(
        user: user,
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name : ${UserModel.of(context)!.name}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Age : ${UserModel.of(context)!.age}',
                style: const TextStyle(fontSize: 20),
              )
            ],
          );
        }),
      ),
    );
  }
}
