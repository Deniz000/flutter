import 'package:ecommerce_app/common/layout/t_grid_view.dart';
import 'package:ecommerce_app/common/widgets/products/brands/t_brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(children: [
                TBrandShowCase(
                  images: const [
                    TImages.shoes,
                    TImages.shoes,
                    TImages.shoes,
                  ],
                  dark: dark,
                ),
                TBrandShowCase(
                  images: const [
                    TImages.shoes,
                    TImages.shoes,
                    TImages.shoes,
                  ],
                  dark: dark,
                ),
                const TSectionHeader(
                  title: 'You might like',
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                TGridView(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical()),
                const SizedBox(height: Sizes.spaceBtwSections),
              ])),
        ]);
  }
}
