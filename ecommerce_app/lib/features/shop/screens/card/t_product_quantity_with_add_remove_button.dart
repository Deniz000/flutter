import 'package:ecommerce_app/common/widgets/images/t_circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor:
              THelperFunctions.isDarkMode(context)
                  ? TColors.darkGrey
                  : TColors.light),
      const SizedBox(width: Sizes.defaultSpace),
      Text(
        '2',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      const SizedBox(width: Sizes.defaultSpace),
      const TCircularIcon(
        icon: Iconsax.add,
        width: 32,
        height: 32,
        size: Sizes.md,
        color: TColors.white,
        backgroundColor: TColors.primary,
      ),
    ]);
  }
}
