import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isChecked = false;
  bool isVisible = false;
  bool isVisibleAgain = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordAgainController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordAgainController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();
  }

  Future login() async {
    try {
      if (confirmPassword()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        addUserDetails(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          int.parse(ageController.text.trim()),
          emailController.text.trim(),
        );
      }
       showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Text("koş bak"),
          );
        },
      );
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    int age,
    String email,
  ) async {
    // await FirebaseAuth.instance.collections.
    FirebaseFirestore.instance.collection('users').add({
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'email': email,
    });
  }

  bool confirmPassword() {
    if (passwordController.text.trim() == passwordAgainController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pastelGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 100),
                child: Text(
                  'Create An Account',
                  style: GoogleFonts.gwendolyn(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 0.9)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 2)),
                    hintText: "First Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 0.9)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 2)),
                    hintText: "Last Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: const InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 0.9)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 2)),
                    hintText: "Age",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: const InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 0.9)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 2)),
                    hintText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primary, width: 0.9)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primary, width: 2)),
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    )),
              ),
              TextField(
                textInputAction: TextInputAction.next,
                controller: passwordAgainController,
                obscureText: isVisibleAgain,
                decoration: InputDecoration(
                    fillColor: white,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 0.9)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primary, width: 2)),
                    hintText: "Password Again",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibleAgain = !isVisibleAgain;
                          });
                        },
                        icon: isVisibleAgain
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Remember me?',
                    style: GoogleFonts.lato(color: primary),
                  ),
                  Checkbox(
                      value: isChecked,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      checkColor: pastelGray,
                      activeColor: primary,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      })
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    "S I G N  U P",
                    style: TextStyle(color: white),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already has an account?',
                    style: GoogleFonts.lato(),
                  ),
                  const SizedBox(width: 7),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Login',
                      style: GoogleFonts.lato(
                          color: primary,
                          decoration: TextDecoration.underline,
                          decorationColor: primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
