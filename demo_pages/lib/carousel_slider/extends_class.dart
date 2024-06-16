import 'package:demo_pages/carousel_slider/carousel_slider.dart';
import 'package:demo_pages/carousel_slider/items/sahabe_items.dart';
import 'package:flutter/material.dart';

abstract class StateInside extends State<CarouselSliderLearn> {
  final sahabeler = Sahabeler().sahabeler;

  //for backgroung image
  late String selectedImage = sahabeler[0].path;
}
