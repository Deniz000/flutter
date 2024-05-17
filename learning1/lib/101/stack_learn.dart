import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
        children: [
          Container(height: 100,
          color: Colors.black26,),

          Padding(
            padding: const EdgeInsets.only(top: 50 ),
            child: Container(height: 100,
            color: Colors.amber,),
          ),
          Positioned(child: Container(color: Colors.green,),
          height: 50,
          top: 70 ,
          right: 0,
          left: 0,)
        ],),
    );
  }
} 