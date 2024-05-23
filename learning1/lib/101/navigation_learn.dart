import 'package:flutter/material.dart';
import 'package:learning1/101/navigate_detail.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const Placeholder(color: Colors.red);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatorToWidget(context, const NavigateDetail());
        },
        child: const Icon(Icons.arrow_right_rounded),
      ),
    );
  }
}

mixin NavigatorManager {
  void navigatorToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      fullscreenDialog: true,
    ));
  }
}
