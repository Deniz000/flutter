import 'package:demo_pages/chatui/models/model.dart';
import 'package:demo_pages/chatui/pages/chatte.dart';
import 'package:demo_pages/chatui/widgets/person_list_view.dart';
import 'package:flutter/material.dart';

class ChatsColumn extends StatelessWidget {
  const ChatsColumn({
    super.key,
    required this.primaryColor,
    required this.people,
  });

  final Color primaryColor;
  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRow(
          primaryColor: primaryColor,
          text: "Recent Chats",
          icon: Icons.person_search_outlined,
        ),
        PersonListView( 
          count: 4,
          people: people,
          height: 350,
        ),
        CustomRow(
          primaryColor: primaryColor,
          text: "All Chats",
        ),
        PersonListView(
          count: 2,
          people: people.reversed.toList(),
          height: 150,
        ),
      ],
    );
  }
}
