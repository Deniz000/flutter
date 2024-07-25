import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.image = '',
    this.title = 'Shoes of',
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(Sizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.dark : TColors.light),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Icon(
                  Iconsax.sticker,
                  color: TColors.dark ,
                ),
              ), //https://youtu.be/tojRS4dJkLg?list=PL5jb9EteFAOAusKTSuJ5eRl1BapQmMDT6&t=1248
            ),
            const SizedBox(height: Sizes.spaceBtwItems / 3),
            Expanded(
              child: SizedBox(
                width: 46,
                child: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
