import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const FittedBox(child: Text("Merhabalar efendim")),
          // Container(
          //   color: Colors.red,
          //   height: 400,
          // ),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(width: 200, color: Colors.amber,),
                Container(width: 200, color: Colors.orange,),
                Container(width: 200, color: Colors.amber[50],),
            ],),
          ),
          const Divider(color: Colors.deepPurple,),
          Container(color: Colors.green,
          height: 400,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
