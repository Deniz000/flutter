import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/widgets/activity_details_card.dart';
import 'package:demo_pages/dashboard/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: <Widget>[
            const SearchWidget(),
            Expanded(child: ActivityDetailsCard()),
           
          ],
        ),
      ),
    );
  }
}
