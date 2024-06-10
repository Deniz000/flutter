import 'package:demo_pages/dashboard/widgets/board.dart';
import 'package:demo_pages/dashboard/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';

class DashboardLearn extends StatefulWidget {
  const DashboardLearn({super.key});

  @override
  State<DashboardLearn> createState() => _DashboardLearnState();
}

class _DashboardLearnState extends State<DashboardLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
              flex: 2,
              child: SizedBox(
                height: double.maxFinite,
                child: SideMenuWidget(),
              )),
          const Expanded(
              flex: 7,
              child: SizedBox(
                height: double.maxFinite,
                child: Board(),
              )),
          Expanded(
              flex: 3,
              child: Container(
                height: double.maxFinite,
                color: Colors.green,
              )),
        ],
      ),
    );
  }
}
