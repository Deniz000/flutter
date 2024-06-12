import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("hey yo everyone " + user.email!),
          MaterialButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: pastelYellow,
          child: Text("Sign Out"),)
        ],
      ),
    );
  }
}
