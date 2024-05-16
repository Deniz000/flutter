import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePadding,
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.green[400],
            ),
            Container(
              height: 100,
              color: Colors.green[400],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
 static const pagePadding = EdgeInsets.all(8.0);
}
