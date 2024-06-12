import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: prefer_interpolation_to_compose_strings
          Text("hey yo everyone " + user.email!),
          MaterialButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: pastelYellow,
          child: const Text("Sign Out"),)
        ],
      ),
    );
  }
}
