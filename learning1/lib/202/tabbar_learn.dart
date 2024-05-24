import 'package:flutter/material.dart';

class TabbarLearn extends StatefulWidget {
  const TabbarLearn({super.key});

  @override
  State<TabbarLearn> createState() => _TabbarLearnState();
}

class _TabbarLearnState extends State<TabbarLearn> {
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomAppBar(
            notchMargin: 5,
            child: TabBar(
              tabs: [
                Tab(
                  text: "home",
                ),
                Tab(
                  text: "f",
                ),
                Tab(
                  text: "page",
                ),
                Tab(
                  text: "page",
                )
              ],
            ),
          ),
          appBar: AppBar(),
          body: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.purple,
            ),
          ]),
        ));
  }
}

enum _MyTabViews { home, settings, favorite, profile }
