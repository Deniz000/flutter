import 'package:demo_pages/chatui/utils/colors.dart';
import 'package:demo_pages/chatui/utils/paddings.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget with PadingValues, ThemeColor {
  CustomTextButton({
    super.key,
    required this.name,
    required this.index,
    required this.pageController,
  });
  final PageController pageController;
  final int index;
  final String name;

  @override
  State<CustomTextButton> createState() => CustomTextButtonState();
}

class CustomTextButtonState extends State<CustomTextButton> {
  int _selectedItem = -1;
  bool isSelected = false;
  List<int> _items = [0, 1, 2];

  void change() {}
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            widget.pageController.jumpToPage(widget.index);
            _selectedItem = widget.index;
          });
          
        },
        style: TextButton.styleFrom(
          backgroundColor: (_selectedItem == widget.index)
              ? widget.secondColor
              : Colors.transparent,
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
