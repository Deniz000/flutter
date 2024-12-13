import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key, required this.title, this.color, this.overflow, this.maxLines, required this.brandTextSize, required this.isThereIcon,
  });

  final String title;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextSizes brandTextSize;
  final bool isThereIcon;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        overflow: overflow,
        maxLines: maxLines,
        style: brandTextSize == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandTextSize == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                : brandTextSize == TextSizes.large
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: color)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: color),),
         const SizedBox(width: Sizes.xs),
          if (isThereIcon)           
              const Icon(Iconsax.verify5, color: TColors.primary, size: Sizes.iconXs)
      
    ]);
  }
}
