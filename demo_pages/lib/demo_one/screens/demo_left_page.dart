import 'package:demo_pages/demo_one/utils/border_radius.dart';
import 'package:demo_pages/demo_one/utils/colors_items.dart';
import 'package:demo_pages/demo_one/widgets/app_bar_container.dart';
import 'package:demo_pages/demo_one/widgets/category_list_view.dart';
import 'package:demo_pages/demo_one/widgets/positioned_container.dart';
import 'package:demo_pages/demo_one/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

class MyDomeLeftPage extends StatelessWidget with CustomRadius, ColorsItems {
  MyDomeLeftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AppBarContainer(secondColor: secondColor, radius60: radius60),
              PositionedContainer(
                  primaryColor: primaryColor, radius60: radius60),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            color: primaryColor,
            height: 500,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: radius60)),
              child: Column(
                children: [
                  const CustomRow(
                    leftname: "Explore Categories",
                  ),
                  CategoryListView(height: 130, radius60: radius60),
                  const CustomRow(leftname: "Populer Search"),
                  SearchListView(primaryColor: primaryColor),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.leftname});
  final String leftname;

  @override
  Widget build(BuildContext context) {
    var plus = "+++";
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftname,
            style:
                const TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1),
          ),
          Text(
            plus,
            style:
                const TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1),
          )
        ],
      ),
    );
  }
}
