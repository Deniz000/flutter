import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text("a"),
              Text("b"),
              Text("c"),
            ],),
          ),
          Expanded(flex: 2, child: Container(color: Colors.red,)),
          const Spacer(flex: 1,),
          Expanded(flex: 4, child: Row(
            children: [
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.blue,)),
              Expanded(child: Container(color: Colors.orange,)),
            ],
          )),
          Expanded(flex: 1, child: Container(color: Colors.pink,)),
        ],
      ),
    );
  }
}
