import 'package:flutter/material.dart';

class IndicatorLeran extends StatelessWidget {
  const IndicatorLeran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CircularProgressIndicator()],
      ),
      body: const Column(
          children : [LinearProgressIndicator(),]
      ),
      
    );
  }
}
