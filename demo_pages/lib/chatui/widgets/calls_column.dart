import 'package:demo_pages/chatui/models/model.dart';
import 'package:demo_pages/chatui/pages/chatte.dart';
import 'package:demo_pages/chatui/widgets/person_list_view.dart';
import 'package:flutter/material.dart';

class CallsColumn extends StatelessWidget {
  const CallsColumn({
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
          text: "Recent Calls",
          icon: Icons.person_search_outlined,
        ),
        PersonListView( 
          count: 5,
          people: people,
          height: 500,
        ),
      ],
    );
  }
}
