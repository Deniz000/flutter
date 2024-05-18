import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning1/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  const Padding(
        padding: EdgeInsets.all(8.0),
        child: _InputTextField(),
      ),
    );
  }
}

class _InputTextField extends StatelessWidget {
  const _InputTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email], //otomatik tamamlama
      textInputAction: TextInputAction.next , // done tuiuna basınca bi sonrakine geçmeye yarıyor
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      buildCounter: (BuildContext,
          {required int currentLength,
          required bool isFocused,
          required int? maxLength}) {
        return AnimatedContainer(
          key: GlobalKey(),
          duration: const Duration(seconds: 1),
          height: 10,
          width: (10*(currentLength ?? 0).toDouble()),
          color: Colors.green,
        );
      },
      decoration: _InputDecoration(),
    );
  }

  InputDecoration _InputDecoration() {
    return const InputDecoration(
      prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(),
        hintText: LanguageItems.mail,
        hintStyle: TextStyle(letterSpacing: 5.0),
        filled: true,);
  }
}
