import 'package:ecommerce_app/common/chips/t_choice_chip.dart';
import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/widgets/text/t_product_title_text.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProjectAttributes extends StatelessWidget {
  const ProjectAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(Sizes.md),
          dark: dark,
          backgroundColor: dark ? TColors.softGrey : TColors.grey,
          child: Row(
            children: [
              const TSectionHeader(
                title: 'Variation',
                showActionButton: false,
              ),
              const SizedBox(
                width: Sizes.spaceBtwItems,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const TProductTitleText(
                      title: 'Price: ',
                      smallSize: true,
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems / 2,
                    ),
                    Text(
                      '\$25',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(
                      width: Sizes.spaceBtwItems/4,
                    ),
                    Text('\$20', style: Theme.of(context).textTheme.titleMedium!)
                  ]),
                  const Row(children: [
                    TProductTitleText(title: 'Status :'),
                    SizedBox(
                      width: Sizes.spaceBtwItems / 1.5,
                    ),
                    Text('In Stock'),
                  ]),
                  const TProductTitleText(
                    title: 'This is the Description',
                    smallSize: true,
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Sizes.spaceBtwItems / 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeader(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Black',
                  onSelected: (p0) {},
                  selected: true,
                ),
                TChoiceChip(
                  text: 'Green',
                  onSelected: (p0) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: 'Purple',
                  onSelected: (p0) {},
                  selected: false,
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeader(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: '36',
                  onSelected: (p0) {},
                  selected: true,
                ),
                TChoiceChip(
                  text: '37',
                  onSelected: (p0) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: '38',
                  onSelected: (p0) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: '39',
                  onSelected: (p0) {},
                  selected: false,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
