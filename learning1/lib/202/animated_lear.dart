import 'package:flutter/material.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> {
  bool _isVisiable = false;

  void _changeVisibility() {
    setState(() {
      _isVisiable = !_isVisiable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisibility();
        },
      ),
      body: _isVisiable ? Text(
        "Text",
        style: context.textTheme().headlineSmall,
      )
      :null,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
