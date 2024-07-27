import 'package:ecommerce_app/common/widgets/text/t_brand_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(
                  Sizes.sm),
              decoration: BoxDecoration(
                color:
                    THelperFunctions.isDarkMode(
                            context)
                        ? Colors.black
                        : Colors.white,
                borderRadius:
                    BorderRadius.circular(100),
              ),
              child: Icon(
                Iconsax.smileys,
                color: dark
                    ? TColors.white
                    : TColors.black,
              )),
        ),
        Expanded(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // !!
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const TBrandTitleText(
                title: 'Nike',
                maxLines: 1,
                brandTextSize: TextSizes.large,
                isThereIcon: true,
              ),
              Text(
                '256 products',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
