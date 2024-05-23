import 'package:demo_pages/chatui/models/model.dart';
import 'package:flutter/material.dart';

mixin PersonList {
  List<Person> chatsPersonList = [
    Person(
      imgName: "w1",
      name: "Bella",
      text: "Typing...",
      hour: "14.16",
    ),
    Person(
      imgName: "m2",
      name: "Bee",
      text: "Ok.. Then see you later",
      hour: "11.36",
      data: Icons.looks_two_sharp,
    ),
    Person(
      imgName: "w2",
      name: "Anne",
      text: "Where are you?",
      hour: "20.30",
      data: Icons.looks_4_sharp,
    ),
    Person(
      imgName: "w3",
      name: "Mommy",
      text: "Don't forget to get an bread",
      hour: "08.30",
      data: Icons.looks_one,
    ),
    Person(
      imgName: "m1",
      name: "Daddy",
      text: "I'll send you some money tomorrow.",
      hour: "17.24",
    ),
    Person(
      imgName: "m3",
      name: "Boss",
      text: "Thank you Sir!",
      hour: "07.42",
      data: Icons.done_all_rounded,
    ),
  ];

  List<Person> statusPersonList = [
    Person(
      imgName: "shark",
      name: "My Status",
      text: "now",
      hour: "",
    ),
    Person(
      imgName: "w1",
      name: "Bella",
      text: "10 minutes ago",
      hour: "",
    ),
    Person(
      imgName: "m2",
      name: "Bee",
      text: "24 minutes ago",
      hour: "",
    ),
    Person(
      imgName: "w2",
      name: "Anne",
      text: "1 hour ago",
      hour: "",
    ),
    Person(
      imgName: "w3",
      name: "Mommy",
      text: "23 hours ago",
      hour: "",
    ),
    Person(
      imgName: "m1",
      name: "Daddy",
      text: "3 minutes ago",
      hour: "",
    ),
    Person(
      imgName: "m3",
      name: "Boss",
      text: "3 minutes ago",
      hour: "",
    ),
  ];

  List<Person> callsPersonList = [
    Person(
      imgName: "w1",
      name: "Bella",
      text: "10 minutes ago",
      hour: "",
      data: Icons.video_call_sharp,
    ),
    Person(
      imgName: "m2",
      name: "Bee",
      text: "24 minutes ago",
      hour: "",
      data: Icons.missed_video_call_sharp,
    ),
    Person(
      imgName: "w2",
      name: "Anne",
      text: "yesterday",
      hour: "",
      data: Icons.phone_missed_outlined,
    ),
    Person(
      imgName: "w3",
      name: "Mommy",
      text: "23 hours ago",
      hour: "",
      data: Icons.phone_callback_sharp,
    ),
      Person(
      imgName: "w3",
      name: "Mommy",
      text: "2 days ago",
      hour: "",
      data: Icons.video_call_sharp,
    ),
  ];
}
