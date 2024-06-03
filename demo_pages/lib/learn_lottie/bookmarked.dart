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
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 1));
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
              "https://lottie.host/ba220bae-2308-4ef2-852f-c8d3bbaf48a0/rLDlk4uV5M.json"),
        ),
      ),
    );
  }
}
