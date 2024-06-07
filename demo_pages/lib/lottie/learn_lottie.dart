import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool bookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(child: ListView(children: const [
        ListTile(title: Text("item1"),),
        ListTile(title: Text("item1"),),
        ListTile(title: Text("item1"),),

      ],),),
      body: GestureDetector(
          onTap: () {
            if (bookmarked) {
              _controller.reverse();
              bookmarked = false;
            } else {
              _controller.forward();
              bookmarked = true;
            }
          },
          child: Center(
            child: Lottie.network(
                controller: _controller,
                "https://lottie.host/3b33812b-001b-40a6-a086-a40caeea0a74/rqsTnR1hru.json"),
          )),
    );
  }
}
