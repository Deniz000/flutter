import 'package:ecommerce_app/common/widgets/images/t_circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCard extends StatelessWidget {
  const TBottomAddToCard({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.defaultSpace, vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.cardRadiuslg),
            topRight: Radius.circular(Sizes.cardRadiuslg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const TCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: TColors.darkGrey,
              width: 40,
              height: 40,
              color: TColors.white,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: Sizes.spaceBtwItems),
            const TCircularIcon(
              icon: Iconsax.add,
              backgroundColor: Colors.black,
              width: 40,
              height: 40,
              color: TColors.white,
            ),
          ]),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(Sizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: Colors.black),
            ),
            child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
