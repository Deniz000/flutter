import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_search_container.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/common/widgets/text/t_vertical_image_text.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/carousal_home.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/t_home_app_bar.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //custom appbar
                  const THomeAppBar(),
                  const SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),
                  //searchbar
                  const TSearchContainer(
                    text: 'Search in Store',
                  ),
                  const SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),

                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeader(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textcolor: TColors.white,
                        ),
                        const SizedBox(
                          height: Sizes.spaceBtwItems,
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            itemCount: 6,
                            shrinkWrap:
                                true, // widget or layout to adjust its size based on its content.
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return TVerticalImageText(
                                onTap: () {},
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            CarousalHome()
          ],
        ),
      ),
    );
  }
}
