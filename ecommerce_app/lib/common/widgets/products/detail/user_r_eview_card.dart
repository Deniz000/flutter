import 'package:ecommerce_app/common/styles/t_rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/detail/product_reviews_screen.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          const CircleAvatar(
            backgroundImage: AssetImage(TImages.google),
          ),
          const SizedBox(width: Sizes.spaceBtwItems),
          Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
        ]),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ]),
      const SizedBox(height: Sizes.spaceBtwItems),
      Row(children: [
        const TRatingBarIndicator(rate: 4.0),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text('02 Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
      ]),
      const SizedBox(width: Sizes.spaceBtwItems),
      const ReadMoreText(
        "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' show less',
        trimCollapsedText: 'show more',
        moreStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        lessStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
      ),
      const SizedBox(height: Sizes.spaceBtwItems),

      TRoundedContainer(
        dark: dark,
        backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.md),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("T's Store", style: Theme.of(context).textTheme.titleMedium),
              Text('02 Nov, 2023',
                  style: Theme.of(context).textTheme.bodyMedium),
            ]),
            const ReadMoreText(
              "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: 'show less',
              trimCollapsedText: 'show more',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary),
            ),
          ]), // Column
        ), // Padding
      ) // TRoundedContainer
    ]);
  }
}
