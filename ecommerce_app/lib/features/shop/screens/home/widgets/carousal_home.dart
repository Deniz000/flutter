import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/shop/controllers/home_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/carousel_items.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarousalHome extends StatelessWidget {
  CarousalHome({
    super.key,
  });
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                  controller.updatePageIndicate(index);
                },
              aspectRatio: 16 / 9,
              viewportFraction: 0.9),
          items: CarouselItems.items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.md),
                        child: Image(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        )));
              },
            );
          }).toList(),
        ),
        Obx( () =>
           AnimatedSmoothIndicator(
            activeIndex: controller.carousalSelectedIndex.value,
            onDotClicked: (index) => controller.dotClickedPage(index),
            count: CarouselItems.items.length,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 25,
              activeDotColor: TColors.dark,
              dotColor: TColors.grey,
            ), // your preferred effect
          ),
        )
      ],
    );
  }
}
