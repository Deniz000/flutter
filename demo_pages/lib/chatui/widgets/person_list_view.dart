import 'package:demo_pages/chatui/models/model.dart';
import 'package:demo_pages/chatui/pages/chatte.dart';
import 'package:flutter/material.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({
    super.key,
    required this.people,
    required this.height,
    required this.count,
  });
  final double height;
  final int count;
  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading: Container(
                padding: const EdgeInsets.all(2.3),
                decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 137, 132),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Image.asset(getPath(people[index].imgName))),
              title: Text(people[index].name),
              subtitle: Text(people[index].text),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(people[index].data, color: Colors.red,),
                  Text(people[index].hour),
                ],
              ),
            );
          }),
    );
  }
}
