import 'package:demo_pages/demo_one/models/item_model.dart';
import 'package:demo_pages/demo_one/utils/border_radius.dart';
import 'package:demo_pages/demo_one/utils/colors_items.dart';
import 'package:demo_pages/demo_one/widgets/icon_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDomeLeftPage extends StatelessWidget with CustomRadius, ColorsItems {
  MyDomeLeftPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<ItemModel> list = ItemModel.list();
    String a = list[0].iconName;
    String b = list[0].jobName;
    String c = list[0].salary;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.only(bottomRight: radius60)),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.apps_rounded,
                        size: 34,
                      ),
                      Icon(
                        FontAwesomeIcons.userLarge,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    height: height * 0.22,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: radius60,
                          bottomRight: radius60,
                          topRight: radius60),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Welcome,",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Find your dream Job!",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                    color: backgroudWhite,
                    borderRadius: BorderRadius.only(topLeft: radius60)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRow(
                      leftData: "Explore Categories",
                    ),
                    const Row(
                      children: [
                        TopCard(),
                        TopCard(),
                        TopCard(),
                        TopCard(),
                      ],
                    ),
                    CustomRow(leftData: "Populer Search"),
                    Row(
                      children: [
                        BottomCard(primaryColor: primaryColor),
                        BottomCard(primaryColor: primaryColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      shape: StadiumBorder(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            IconCard(
              icon: FontAwesomeIcons.computer,
              height: 50,
              width: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("IT"),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  const BottomCard({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 0,
      child: const SizedBox(
        width: 150,
        height: 180,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("UI/UX Designer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, wordSpacing: 20, height: 1.3), ),
              Text("4 Job Opportunatiy", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, height: 3), ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.leftData});
  final String leftData;

  @override
  Widget build(BuildContext context) {
    var plus = "+++";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftData,
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
