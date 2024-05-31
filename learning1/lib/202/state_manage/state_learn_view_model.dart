//view var bununla iş yapan ara katman 
import 'package:flutter/material.dart';
import 'package:learning1/202/state_manage/state_manage.dart';

//servis çekmeleri vs her şeyi burada yapıyoruz orda kullanıyoruz oha deli dehşet 
abstract class StateLearnViewModel  extends State<StateManageLearn> {
   bool isVisiable = false;
  bool isOpasity = false;

  void changeVisibility() {
    setState(() {
      isVisiable = !isVisiable;
    });
  }

  void changeOpasity() {
    setState(() {
      isOpasity = !isOpasity;
    });
  }
}