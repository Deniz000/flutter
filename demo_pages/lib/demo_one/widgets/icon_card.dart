import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard(
      {super.key,
      required this.icon,
      required this.height,
      required this.width});
  final IconData icon;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Icon(icon),
    );
  }
}
