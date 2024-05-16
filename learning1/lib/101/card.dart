import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          _CardTheme(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Center(child: Text("Card")),
            ),
          ),
             _CardTheme(
            child: SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text("Card")),
            ),
          )
        ],
      ),
    );
  }
}

class _CardTheme extends StatelessWidget {
  const _CardTheme({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Theme.of(context).colorScheme.error,
      child: child,
    );
  }
}
//StadiumBorder()
//CircleBorder()
//RoundedrectangleBOrder()
