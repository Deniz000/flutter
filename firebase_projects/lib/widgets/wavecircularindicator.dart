import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Circularindicator extends StatelessWidget {
  const Circularindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWave(
        color: Colors.white,
        size: 10.0,
      ),
    );
  }
}
