import 'package:flutter/material.dart';

class MyCollectionDemo extends StatefulWidget {
  const MyCollectionDemo({super.key});

  @override
  State<MyCollectionDemo> createState() => _MyCollectionDemoState();
}

class _MyCollectionDemoState extends State<MyCollectionDemo> {
  late List<ColloectionModel> _collection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _collection = [
      ColloectionModel(
          imagePath:
              "/Users/guldenizozdemir/flutter_learn_process/start_week/learning1/assets/whale.jpeg",
          title: "Whale Art",
          price: 3.4),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: _collection.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3.0,
              shadowColor: Colors.blue[700],
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 240, child: Image.asset(_collection[index].imagePath,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text(_collection[index].title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      Text('${_collection[index].price} eth')
                    ],),
                  )
                ],
              ),
            ); 
          }),
    );
  }
}

class ColloectionModel {
  final String imagePath;
  final String title;
  final double price;

  ColloectionModel(
      {required this.imagePath, required this.title, required this.price});
}
