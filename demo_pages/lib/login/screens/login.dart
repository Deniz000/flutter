import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/login/asset/mosque.png",
              height: 200,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "السلام عليكم",
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                focusColor: Colors.blue,
                hoverColor: Colors.blue,
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: isVisible,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3)),
                  focusColor: Colors.blue,
                  hoverColor: Colors.blue,
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      changeVisible();
                    },
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 50),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            const Row(
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.blue,
              thickness: 0.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                social(
                  FontAwesomeIcons.google,
                ),
                social(
                  FontAwesomeIcons.facebook,
                ),
                social(
                  FontAwesomeIcons.twitter,
                ),
              ],
            ),
            const Text(
              "Create an account?",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Card social(IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Icon(
          icon,
          size: 40,
          color: const Color.fromARGB(255, 75, 119, 140),
        ),
      ),
    );
  }
}
