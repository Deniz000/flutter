import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  static HomeController instance = Get.find();

  Rx<int> carousalSelectedIndex = 0.obs;
  final pageController = PageController();
  final CarouselSliderController controller = CarouselSliderController();

  void updatePageIndicate(index) {
    carousalSelectedIndex.value = index;
  }

  void dotClickedPage(index) {
    carousalSelectedIndex.value = index;
    controller.jumpToPage(index);
  }
}
