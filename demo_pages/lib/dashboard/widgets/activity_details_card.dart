import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/data/healty_items.dart';
import 'package:demo_pages/dashboard/model/healty_model.dart';
import 'package:flutter/material.dart';

class ActivityDetailsCard extends StatelessWidget {
  ActivityDetailsCard({Key? key}) : super(key: key);

  final details = HealtyDetails().details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: details.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (_, index) {
            return CustomCard(detail: details[index]);
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final HealtyModel detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        color: selectionColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              detail.icon,
              height: 40,
              width: 40,
            ),
            Text(
              detail.value,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              detail.title,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
