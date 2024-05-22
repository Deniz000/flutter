import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// used in MyDomeLeftPage
class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.secondColor,
    required this.radius60,
  });

  final Color secondColor;
  final Radius radius60;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
      height: 250,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.only(bottomRight: radius60),
      ),
      child: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.apps_rounded,
          size: 34,
        ),
        Icon(
          FontAwesomeIcons.userLarge,
          size: 24,
        ),
      ],
    ),
    );
  }
}
