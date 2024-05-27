import 'package:flutter/material.dart';

class CardBorderradius extends StatelessWidget {
  const CardBorderradius({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.circleProfileWidht.value(),
          color: Colors.blue[900],
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidht }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidht:
        return 60;
    }
  }
}
