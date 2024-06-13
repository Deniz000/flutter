import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FadingCircularIndicator extends StatelessWidget {
  const FadingCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );
  }
}
f