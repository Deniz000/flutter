import 'package:ecommerce_app/common/layout/t_grid_view.dart';
import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tappbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_search_container.dart';
import 'package:ecommerce_app/common/widgets/products/brands/t_brand_card.dart';
import 'package:ecommerce_app/common/widgets/products/cart/t_cart_counter_icon.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/features/shop/screens/store/widget/t_category_tab.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: TAppBar(
              title: Text(
                'Store',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              showBackArrow: false,
              actions: [TCartCounterIcon(onPressed: () {}, iconColor: dark ? TColors.light : TColors.black,)],
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
                                    child: TBrandCard(dark: dark),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      bottom: const TTabBar(tabs: [
                        Tab(
                          child: Text("Sports"),
                        ),
                        Tab(
                          child: Text("Furniture"),
                        ),
                        Tab(
                          child: Text("Elektronics"),
                        ),
                        Tab(
                          child: Text("Clothes"),
                        ),
                        Tab(
                          child: Text("Sports"),
                        ),
                      ]),
                    )
                  ];
                },
                body: TabBarView(children: [
                 CategoryTab(dark: dark,),
                 CategoryTab(dark: dark,),
                 CategoryTab(dark: dark,),
                 CategoryTab(dark: dark,),
                 CategoryTab(dark: dark,),
                ]))));
  }
}

