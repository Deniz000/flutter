import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
                radius: Sizes.md,
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: TColors.secondary.withOpacity(0.8),
                dark: false,
                child: Text(
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black),
                )),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: Sizes.spaceBtwItems),
             const Text(
              '\$175',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ],
    );
  }
}
