import 'package:demo_pages/demo_one/widgets/icon_card.dart';
import 'package:flutter/material.dart';
import 'package:demo_pages/demo_one/utils/icon_data_helper.dart';

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
    IconData iconData = getIconData(iconName);

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          leading: IconCard(icon: iconData, height: 60, width: 60,),
          title: Text(jobName.toString()),
          subtitle: Text(salary.toString()),
        ),
      ),
    );
  }
}
