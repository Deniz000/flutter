import 'package:flutter/material.dart';

// used in MyDomeLeftPage 
class PositionedContainer extends StatelessWidget {
  const PositionedContainer({
    super.key,
    required this.primaryColor,
    required this.radius60,
  });

  final Color primaryColor;
  final Radius radius60;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -100,
        child: Container(
          padding: const EdgeInsets.all(30),
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: radius60,
                  topRight: radius60,
                  bottomRight: radius60)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Welcome,",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                "Find your dream Job!",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -1),
              ),
            ],
          ),
        ));
  }
}
