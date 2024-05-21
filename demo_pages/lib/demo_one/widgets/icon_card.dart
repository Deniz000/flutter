import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Icon(icon),
    );
  }
}
