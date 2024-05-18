import 'package:flutter/material.dart';
import 'package:learning1/101/container_view.dart';
import 'package:learning1/101/list_tile.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController();
  int _currentPage = 0;
  void _updateOageIndex(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: Duration(seconds: 1), curve: Curves.ease);
            },
            child: Icon(Icons.chevron_left),
          ),
          Text((_currentPage+1).toString()),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.ease);
            },
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
      body: PageView(
        onPageChanged: _updateOageIndex,
        controller: _pageController,
        children: [
          ListTileLearn(),
          ListTileLearn(),
          ContainerView(),
        ],
      ),
    );
  }
}
