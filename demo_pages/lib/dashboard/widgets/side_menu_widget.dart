import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/data/menu_items.dart';
import 'package:demo_pages/dashboard/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final menu = SideMenu().menu;
    return Scaffold(
      backgroundColor: background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, index) {
              return buildMenuEntry(menu[index], index);
            }),
      ),
    );
  }

  Widget buildMenuEntry(MenuModel menu, int index) {
    bool isSelected = selectedItem == index;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: isSelected ? selectionColor : null,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedItem = index;
        }),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  menu.icon,
                  color: isSelected ? background : white,
                ),
              ),
              Text(
                menu.name,
                style: TextStyle(
                  color: isSelected ? background : white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
