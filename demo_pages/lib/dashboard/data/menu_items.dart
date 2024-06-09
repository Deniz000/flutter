import 'package:demo_pages/dashboard/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenu {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.home, name: "Dashboard"),
    MenuModel(icon: Icons.person, name: "Profile"),
    MenuModel(icon: Icons.run_circle, name: "Exercise"),
    MenuModel(icon: Icons.settings, name: "Settings"),
    MenuModel(icon: Icons.history, name: "History"),
    MenuModel(icon: Icons.logout, name: "SignOut"),
  ];
}
