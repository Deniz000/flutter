import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/styles/t_shadow.dart';
import 'package:ecommerce_app/common/widgets/icon/facorite_icon.dart';
import 'package:ecommerce_app/common/widgets/images/t_rounded_images.dart';
import 'package:ecommerce_app/common/widgets/text/t_brand_title_text.dart';
import 'package:ecommerce_app/common/widgets/text/t_product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
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
              dark: dark,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 12,
                    child: TRoundedImage(
                      dark: dark,
                      imageUrl: TImages.shoes,
                      applyImageRadius: true,
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      dark: dark,
                      radius: Sizes.sm,
                      backgroundColor: TColors.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: const Text("25%"),
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const TProductTitleText(
                  title: 'Child Nike Air Shoes',
                ),
                const SizedBox(
                  height: Sizes.spaceBtwItems / 2,
                ),
                const TBrandTitleText(
                  title:  'Nike',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  brandTextSize: TextSizes.small,
                  isThereIcon: false,
                ),
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
