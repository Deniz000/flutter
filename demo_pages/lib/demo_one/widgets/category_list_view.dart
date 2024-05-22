import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.radius60,
    required this.height,
  });
  final double height;
  final Radius radius60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryContainer(
              icon: Icons.computer, name: "IT", radius60: radius60),
          CategoryContainer(
              icon: Icons.science, name: "Science", radius60: radius60),
          CategoryContainer(
              icon: Icons.nature_people_outlined,
              name: "Culture",
              radius60: radius60),
          CategoryContainer(
              icon: Icons.biotech_outlined,
              name: "Biology",
              radius60: radius60),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.radius60,
    required this.name,
    required this.icon,
  });
  final String name;
  final icon;
  final Radius radius60;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(radius60),
              ),
              child: Icon(icon)),
          Text(name),
        ],
      ),
    );
  }
}
