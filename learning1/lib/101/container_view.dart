import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 200,
            child: Text('a'*500),
          ),
           SizedBox.square(
            dimension: 50,
            child: Text('a'*50),
          ),
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              shape: BoxShape.circle, 
              color: Colors.amber,),
            child: Text('a'*4),
          )
        ],
      ),
    );
  }
}
