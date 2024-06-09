import 'package:flutter/material.dart';
import 'package:learning1/core/random_image.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: const Column(children: [
        Expanded(flex: 4, 
        child: Stack(
          alignment: Alignment.center,
          children:[
          Positioned.fill(bottom: 40,child: RandomImage(),),
          Positioned(
            height:80,
            bottom: 0,
            width: 300,
            child: Card(),)
        ])),
        Spacer(flex: 6,),
      ],),
    );
  }
}
