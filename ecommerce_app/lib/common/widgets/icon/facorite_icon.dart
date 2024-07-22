import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class FacoriteIcon extends StatelessWidget {
  const FacoriteIcon({
    super.key,
    required this.dark,
    required this.icon,
    this.width,
    this.height,
    this.size = Sizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
