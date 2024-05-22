import 'package:flutter/material.dart';

class MiddleCard extends StatelessWidget {
  MiddleCard({super.key, required this.imageName, required this.action});
  String imageName;
  String action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 10,
                  blurRadius: 10,
                  color: Colors.grey.shade200,
                )
              ]),
          child: Image.asset("lib/walletappui/icons/$imageName.png"),
        ),
        Text(
          action,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
