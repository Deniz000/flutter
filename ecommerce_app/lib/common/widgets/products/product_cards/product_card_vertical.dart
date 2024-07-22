import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/styles/t_rounded_images.dart';
import 'package:ecommerce_app/common/styles/t_shadow.dart';
import 'package:ecommerce_app/common/widgets/icon/facorite_icon.dart';
import 'package:ecommerce_app/common/widgets/text/t_product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 200,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(Sizes.productImageRadius),
            color: THelperFunctions.isDarkMode(context)
                ? TColors.darkGrey
                : TColors.white,
          ),
          child: Column(children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const Positioned.fill(
                    top: 12,
                    child: TRoundedImage(
                      imageUrl: TImages.shoes,
                      applyImageRadius: true,
                      padding: EdgeInsets.symmetric(horizontal: Sizes.sm),
                    ),
                  ),
                  const Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: TColors.secondary,
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: Text("25%"),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FacoriteIcon(
                        dark: dark,
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Column(children: [
                const TProductTitleText(
                  title: 'Child Nike Air Shoes',
                ),
                const SizedBox(
                  height: Sizes.spaceBtwItems / 2,
                ),
                Row(children: [
                  Text('Nike',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(width: Sizes.xs),
                  const Icon(Iconsax.verify5,
                      color: TColors.primary, size: Sizes.iconXs),
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$35.5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        height: Sizes.iconLg,
                        width: Sizes.iconLg,
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.cardRadiushMd),
                              bottomRight:
                                  Radius.circular(Sizes.productImageRadius),
                            )),
                        child: const Icon(
                          Iconsax.add,
                          color: TColors.white,
                        ),
                      )
                    ]),
              ]),
            ),
          ])),
    );
  }
}
