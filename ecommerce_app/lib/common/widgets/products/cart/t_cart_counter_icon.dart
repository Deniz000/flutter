import 'package:ecommerce_app/features/shop/screens/card/cart.dart'; 
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor = TColors.white,
    required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: ()=> Get.to(()=> const CartScreen()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor)),
      Positioned(
          right: 3,
          top: 3,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context) ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text('2',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: Colors.white, fontSizeFactor: 0.8))), // Center
          ))
    ]);
  }
}
