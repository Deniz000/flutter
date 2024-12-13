import 'package:ecommerce_app/common/widgets/images/t_rounded_images.dart';
import 'package:ecommerce_app/common/widgets/text/t_brand_title_text.dart';
import 'package:ecommerce_app/features/shop/screens/card/t_product_quantity_with_add_remove_button.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TRoundedImage(
          dark: THelperFunctions.isDarkMode(context),
          imageUrl: TImages.lavi1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(Sizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: Sizes.spaceBtwSections,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TBrandTitleText(
            title: 'Lavina',
            isThereIcon: true,
            brandTextSize: TextSizes.medium,
          ),
          const TBrandTitleText(
            title: 'Black Shoes',
            isThereIcon: false,
            brandTextSize: TextSizes.medium,
            maxLines: 1,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Color : ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: 'Black ', style: Theme.of(context).textTheme.bodyLarge),
            TextSpan(
                text: 'Size : ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '38 ', style: Theme.of(context).textTheme.bodyLarge),
          ]) // TextSpan
              ),
          const SizedBox(height: Sizes.spaceBtwSections),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TProductQuantityWithAddRemoveButton(),
              SizedBox(width: 20,),
              Text(
                '\$239',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          )
        ]),
      ]),
    ]);
  }
}
