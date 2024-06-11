import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/data/healty_items.dart';
import 'package:demo_pages/dashboard/model/healty_model.dart';
import 'package:flutter/material.dart';

class ActivityDetailsCard extends StatelessWidget {
  ActivityDetailsCard({super.key});

  final details = HealtyDetails().details;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: details.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              mainAxisExtent: 150
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
    super.key,
    required this.detail,
  });

  final HealtyModel detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        color: selectionColor.withOpacity(0.3),
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
              style: const TextStyle(fontSize: 15,
              color: white),
            ),
            Text(
              detail.title,
              style: const TextStyle(fontSize: 15,
              color: white),
            ),
          ],
        ),
      ),
    );
  }
}
