import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget/user.dart';
import 'package:flutter_inheritedwidget/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedNotifier Demo'),
      ),
      body: Center(
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
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              hintText: 'What is your name?',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _ageController,
                          decoration: const InputDecoration(
                            hintText: 'What is your age?',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              User updatedUSer = User(name: _nameController.text, age: _ageController.text);
                              Navigator.pop(context);
                              setState(() {user = updatedUSer;});
                            },
                            child: const Text("Save"))
                      ],
                    ),
                  );
                });
          },
          label: const Text('Set Profile')),
    );
  }
}
