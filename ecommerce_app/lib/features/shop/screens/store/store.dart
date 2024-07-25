import 'package:ecommerce_app/common/layout/t_grid_view.dart';
import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_search_container.dart';
import 'package:ecommerce_app/common/widgets/products/cart/t_cart_counter_icon.dart';
import 'package:ecommerce_app/common/widgets/text/t_brand_title_text.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
        actions: [TCartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: Sizes.defaultSpace,
                      ),
                      const TSearchContainer(
                          text: 'Search In Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(
                        height: Sizes.defaultSpace,
                      ),
                      TSectionHeader(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: Sizes.defaultSpace / 1.5,
                      ),
                      TGridView(
                        itemCount: 4,
                        mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              child: TRoundedContainer(
                                dark: dark,
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                          width: 56,
                                          height: 56,
                                          padding: const EdgeInsets.all(Sizes.sm),
                                          decoration: BoxDecoration(
                                            color: THelperFunctions.isDarkMode(
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
                                        mainAxisSize: MainAxisSize.min, // !!
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
                                ),
                              ),
                            );
                          },)
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
