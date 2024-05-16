import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('btn1')),
          ElevatedButton(
              onPressed: () {}, child: const Text('2 ')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
          FloatingActionButton(onPressed: (){}, child: const Text('3')),
          OutlinedButton(
            onPressed: () {
              //servise istek att
              //sayfanın rengini düzenle 
            },
            style: OutlinedButton.styleFrom(backgroundColor: Colors.amber), 
            child: const Text('4')),
          InkWell(onTap: () {}, child: const Text('5')),

          Container(
            height: 100,
            color: Colors.black,
          ),

        ],
      ),
    );
  }
}
