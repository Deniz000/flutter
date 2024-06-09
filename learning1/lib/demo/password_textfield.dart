import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key});

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _isSecure = false;

  void _changeVisible() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        obscureText: _isSecure,
        obscuringCharacter: "•",
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: "Password",
          suffix: _onVisibleMethod(),
        ),
      ),
    );
  }

  IconButton _onVisibleMethod() {
    return IconButton(
            onPressed: () {
              _changeVisible();
            },
            icon:  AnimatedCrossFade(firstChild: const Icon(Icons.visibility), 
            secondChild: const Icon(Icons.visibility_off_rounded),
            duration: const Duration(milliseconds: 100),
            crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond));
            // icon: _isSecure
            //     ? Icon(Icons.visibility)
            //     : Icon(Icons.visibility_off_rounded));
  }
}
