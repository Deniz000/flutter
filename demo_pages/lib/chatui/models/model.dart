import 'package:flutter/material.dart';

class Person {
  String imgName;
  String name;
  String text;
  String hour;
  IconData? data;
  Person({
    required this.imgName,
    required this.name,
    required this.text,
    required this.hour,
    this.data,
  });
}
