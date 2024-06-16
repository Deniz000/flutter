import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  String name;

  UserViewModel({this.name = "Learning..."});

  void changeUserName({required String newUserName}) async{
    name = newUserName;
    notifyListeners();
  }
}
