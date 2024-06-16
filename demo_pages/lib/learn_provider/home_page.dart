import 'package:demo_pages/learn_provider/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(context.watch<UserViewModel>().name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromARGB(255, 228, 228, 220),
                    hintText: "enter a name",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<UserViewModel>().changeUserName(
                        newUserName: userNameController.text.trim());
                    userNameController.clear();
                  },
                  child: const Text("Save"))
            ],
          ),
        ],
      ),
    );
  }
}
