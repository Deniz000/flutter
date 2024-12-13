import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/t_curved_edges_widget.dart';
import 'package:ecommerce_app/common/widgets/icon/facorite_icon.dart';
import 'package:ecommerce_app/common/widgets/images/t_rounded_images.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 410,
              child: Padding(
                padding: EdgeInsets.all(Sizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                  image: AssetImage(TImages.lavi1),
                )),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: Sizes.spaceBtwItems,
                        ),
                    itemCount: 4,
                    itemBuilder: (_, __) => TRoundedImage(
                        width: 80,
                        backgroundColor:
                            dark ? TColors.dark : TColors.light,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(Sizes.sm),
                        imageUrl: TImages.lavi2,
                        dark: dark)),
              ),
            ),
             TAppBar(
              title: const Text(""),
              showBackArrow: true,
              actions: [
                FacoriteIcon(
                  dark: dark,
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
