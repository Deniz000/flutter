import 'package:demo_pages/chatui/models/model.dart';
import 'package:demo_pages/chatui/utils/colors.dart';
import 'package:demo_pages/chatui/utils/paddings.dart';
import 'package:demo_pages/chatui/utils/person_list.dart';
import 'package:demo_pages/chatui/widgets/calls_column.dart';
import 'package:demo_pages/chatui/widgets/chats_column.dart';
import 'package:demo_pages/chatui/widgets/person_list_view.dart';
import 'package:demo_pages/chatui/widgets/text_button.dart';
import 'package:flutter/material.dart';

class ChatteAppUI extends StatefulWidget {
  const ChatteAppUI({super.key});

  @override
  State<ChatteAppUI> createState() => _ChatteAppUIState();
}

class _ChatteAppUIState extends State<ChatteAppUI> with ThemeColor, PersonList {
  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    List<String> list = [
      "Chats",
      "Status",
      "Calls",
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
            children: listGenerate(controller, list),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: whiteTone, borderRadius: BorderRadius.circular(30)),
                child: PageView(
                  controller: controller,
                  children: [
                    ChatsColumn(
                        primaryColor: primaryColor, people: chatsPersonList),
                    StatusColumn(
                        statusPersonList: statusPersonList,
                        primaryColor: primaryColor),
                    CallsColumn(
                        primaryColor: primaryColor, people: callsPersonList),
                  ],
                )),
          )
        ],
      ),
    );
  }

  List<Widget> listGenerate(PageController controller, List<String> list) {
    return List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CustomTextButton(
          pageController: controller,
          name: list[index],
          index: index,
        ),
      );
    });
  }
}

class StatusColumn extends StatelessWidget {
  const StatusColumn({
    super.key,
    required this.statusPersonList,
    required this.primaryColor,
  });

  final List<Person> statusPersonList;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonListView(count: 1, people: statusPersonList, height: 100),
        CustomRow(primaryColor: primaryColor, text: "Recent updates"),
        PersonListView(
            count: 5, people: statusPersonList.reversed.toList(), height: 400),
      ],
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
