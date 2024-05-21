import 'package:demo_pages/demo_one/models/item_model.dart';
import 'package:demo_pages/demo_one/utils/colors_items.dart';
import 'package:demo_pages/demo_one/widgets/item_card.dart';
import 'package:flutter/material.dart';

class MyDemoOne extends StatelessWidget with ColorsItems {
  MyDemoOne({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<ItemModel> items = [
      ItemModel(
          iconName: "instagram",
          jobName: "Lead UI Developer",
          salary: "\$10k - \$20k"),
      ItemModel(
          iconName: "skype",
          jobName: "Senior Web Designer",
          salary: "\$10k - \$18k"),
      ItemModel(
          iconName: "google", jobName: "UI/UX Designer", salary: "\$8k - \$16k"),
      ItemModel(
          iconName: "dribbble",
          jobName: "Graphic Designer",
          salary: "\$8k - \$14k"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 70, left: 40, bottom: 30),
                alignment: Alignment.topLeft,
                height: height * 0.3,
                width: width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(60.0),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios_new),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UI/UX",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Designer",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "4 Job Opportunities",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: primaryColor,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ItemCard(
                          iconName: items[index].iconName,
                          jobName: items[index].jobName,
                          salary: items[index].salary,
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
