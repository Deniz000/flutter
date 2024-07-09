import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_search_container.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/features/shop/screens/home/t_home_app_bar.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                                onTap: () {
                                },
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
          ],
        ),
      ),
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.image = '',
    this.title = 'Shoes',
    this.textColor =  TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(Sizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.dark : TColors.light),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(Iconsax
                    .sticker,
                    color: dark ? TColors.light : TColors.dark,),), //https://youtu.be/tojRS4dJkLg?list=PL5jb9EteFAOAusKTSuJ5eRl1BapQmMDT6&t=1248
              ),
          
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
