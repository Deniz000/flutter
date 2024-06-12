import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Text("Passwork rest link sent! Check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter email address and we will send you an password reset email" 
                    "to your account",
                textAlign: TextAlign.center,
                style: GoogleFonts.encodeSansSc(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
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
              MaterialButton(
                onPressed: resetPassword,
                color: pastelYellow,
                child: const Text("S E N D   E M A I L"),
              )
            ]),
      ),
    );
  }
}
