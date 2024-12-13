import 'package:ecommerce_app/common/widgets/products/detail/product_attributes.dart';
import 'package:ecommerce_app/common/widgets/products/detail/product_reviews_screen.dart';
import 'package:ecommerce_app/common/widgets/products/detail/produt_meta_data.dart';
import 'package:ecommerce_app/common/widgets/products/detail/t_bottom_add_to_card.dart';
import 'package:ecommerce_app/common/widgets/products/detail/t_product_image_slider.dart';
import 'package:ecommerce_app/common/widgets/products/detail/t_rating_and_share.dart';
import 'package:ecommerce_app/common/widgets/text/t_brand_title_text.dart';
import 'package:ecommerce_app/common/widgets/text/t_product_title_text.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(children: [
          TProductImageSlider(dark: dark),
          Padding(
            padding: const EdgeInsets.only(
              right: Sizes.defaultSpace,
              left: Sizes.defaultSpace,
              bottom: Sizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TRatingAndShare(),
                const ProductMetaData(),
                const SizedBox(
                  height: Sizes.spaceBtwItems / 1.5,
                ),
                const TProductTitleText(
                  title: 'Lavina Shoes x',
                  smallSize: false,
                ),
                const SizedBox(
                  height: Sizes.spaceBtwItems / 1.5,
                ),
                const Row(children: [
                  TProductTitleText(title: 'Status :'),
                  SizedBox(
                    width: Sizes.spaceBtwItems / 1.5,
                  ),
                  Text('In Stock'),
                ]),
                const TBrandTitleText(
                  title: 'Lavina',
                  brandTextSize: TextSizes.medium,
                  isThereIcon: true,
                ),
                const SizedBox(
                  height: Sizes.spaceBtwItems / 2,
                ),
                const ProjectAttributes(),
                const SizedBox(height: Sizes.spaceBtwSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    )),
                const SizedBox(height: Sizes.spaceBtwSections),
                const TSectionHeader(
                  title: "Description",
                  showActionButton: false,
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                const ReadMoreText(
                  "Designed with elegant black details, Lavina Black shoes offer both a modern and classic look with their soft-textured leather surface and stylish stitching. Thanks to their lightweight sole and ergonomic structure, they provide comfort all day long.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(height: Sizes.spaceBtwItems),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeader(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(()=> const ProductReviewsScreen()),
                      )
                    ]),
                const SizedBox(height: Sizes.spaceBtwSections),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
