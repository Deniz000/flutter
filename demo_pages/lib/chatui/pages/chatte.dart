import 'package:demo_pages/chatui/models/model.dart';
import 'package:demo_pages/chatui/utils/colors.dart';
import 'package:demo_pages/chatui/utils/paddings.dart';
import 'package:demo_pages/chatui/widgets/text_button.dart';
import 'package:flutter/material.dart';

class ChatteAppUI extends StatefulWidget {
  const ChatteAppUI({super.key});

  @override
  State<ChatteAppUI> createState() => _ChatteAppUIState();
}

class _ChatteAppUIState extends State<ChatteAppUI> with ThemeColor {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Chats",
      "Status",
      "Calls",
    ];
    List<Person> people = [
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

    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondColor,
        child: Icon(
          Icons.message_outlined,
          color: whiteTone,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          size: 28,
          color: whiteTone,
        ),
        title: Text(
          "Chatte",
          style: TextStyle(
              fontFamily: AutofillHints.birthdayDay, color: whiteTone),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.camera_alt_outlined,
              color: whiteTone,
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              setState(() {
                print("çalıştı $index");
              });
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomTextButton(
                  name: list[index],
                  index: index,
                  isSelected: false,
                ),
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: whiteTone, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  CustomRow(
                    primaryColor: primaryColor,
                    text: "Recent Chats",
                    icon: Icons.person_search_outlined,
                  ),
                  CahtsListView(
                    people: people,
                    height: 350,
                  ),
                  CustomRow(
                    primaryColor: primaryColor,
                    text: "All Chats",
                  ),
                  CahtsListView(
                    people: people.reversed.toList(),
                    height: 150,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CahtsListView extends StatelessWidget {
  const CahtsListView({
    super.key,
    required this.people,
    required this.height,
  });
  final double height;
  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading: Image.asset(getPath(people[index].imgName)),
              title: Text(people[index].name),
              subtitle: Text(people[index].text),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(people[index].data ?? null),
                  Text(people[index].hour),
                ],
              ),
            );
          }),
    );
  }
}

String getPath(String name) =>
    "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/chatui/avatars/$name.png";

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.primaryColor,
    required this.text,
    this.icon,
  });

  final Color primaryColor;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                letterSpacing: -1,
                color: primaryColor,
                fontWeight: FontWeight.w600),
          ),
          Icon(
            icon,
            size: 32,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

class TextButtons extends StatelessWidget with PadingValues {
  TextButtons({
    super.key,
    required this.color,
    required this.name,
  });

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(
                horizontal: textButton2Xx, vertical: textButtonX),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
