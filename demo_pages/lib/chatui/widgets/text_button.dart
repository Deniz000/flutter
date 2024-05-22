import 'package:demo_pages/chatui/utils/colors.dart';
import 'package:demo_pages/chatui/utils/paddings.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget with PadingValues, ThemeColor {
  CustomTextButton({
    super.key,
    required this.name,
    required this.index,
    required this.isSelected,
  });
  final int index;
  final String name;
  bool isSelected; //background için

  @override
  State<CustomTextButton> createState() => CustomTextButtonState();
}

class CustomTextButtonState extends State<CustomTextButton> {
  
  Color backgroundColor = Colors.transparent;

  void setSelectedItem(int value) {
    setState(() {
      switch (widget.index) {
        case 1:
          
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
        },
        style: TextButton.styleFrom(
          backgroundColor:
              (widget.isSelected) ? widget.secondColor : Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(
              horizontal: widget.textButton2Xx, vertical: widget.textButtonX),
        ),
        child: Text(
          widget.name,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
