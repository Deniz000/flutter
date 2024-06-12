import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key,
  required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pastelGray,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.android,
              size: 100,
              color: pastelGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'Welcome Back',
                style: GoogleFonts.gwendolyn(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  fillColor: white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pastelBlue, width: 0.9)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pastelBlue, width: 2)),
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: pastelBlue, width: 0.9)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: pastelBlue, width: 2)),
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          changeVisibility();
                        },
                        icon: isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(passwordController.text);
                  login();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: pastelYellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    )),
                child: const Text("L O G I N")),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to here?',
                  style: GoogleFonts.lato(),
                ),
                const SizedBox(width: 7),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    'Create an account.',
                    style: GoogleFonts.lato(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
