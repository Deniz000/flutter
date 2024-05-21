import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.iconName,
    required this.jobName,
    required this.salary,
  });
  final String iconName;
  final String jobName;
  final String salary;


  @override
  Widget build(BuildContext context) {
  IconData iconData = _getIconData(iconName);
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          leading: IconCard(icon: iconData),
          title: Text(jobName.toString()),
          subtitle: Text(salary.toString()),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Icon(icon),
    );
  }
}

IconData _getIconData(String iconName) {
  switch (iconName) {
    case 'instagram':
      return FontAwesomeIcons.instagram;
    case 'skype':
      return FontAwesomeIcons.skype;
    case 'google':
      return FontAwesomeIcons.google;
    case 'dribbble':
      return FontAwesomeIcons.dribbble;
    default:
      return FontAwesomeIcons.exclamation; // Varsayılan bir ikon
  }
}

mixin ColorsItems {
  final Color primaryColor = const Color.fromARGB(200, 242, 215, 183);
  // White color should have a different value if needed, currently same as primaryColor
  final Color white = Colors.white; // Changed to standard white color
}

class ItemModel {
  String iconName;
  String jobName;
  String salary;

  ItemModel(
      {required this.iconName, required this.jobName, required this.salary});
}
