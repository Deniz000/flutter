import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpansionTileCardLearn extends StatefulWidget {
  ExpansionTileCardLearn({super.key});

  @override
  State<ExpansionTileCardLearn> createState() => _ExpansionTileCardLearnState();
}

class _ExpansionTileCardLearnState extends State<ExpansionTileCardLearn> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ExpansionTileCard(
        key: cardA,
        title: Text("başlık"),
        subtitle: Text("alt başlık"),
        leading: CircleAvatar(
          child: Text("A"),
        ),
        children: const [
          Divider(
            thickness: 1.6,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electroni"),
            ),
          ),
          ButtonBar() //butonlarını da buraya yazıyoruz. 
        ],
      ),
    );
  }
}
