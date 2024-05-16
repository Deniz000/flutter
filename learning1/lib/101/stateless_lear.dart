import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

    final String data = "StateLess Öğrenme Alanı";
    final String title = "deneme";
    final String title2 = "yapıyorum";
    
    final String title3 = "aslan";
    final String title4 = "parçacı";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Column(
        children: [
          TextSheme(title: title),
          TextSheme(title: title2),
          _takeABlank(),
          TextSheme(title: title3),
          TextSheme(title: title4),
        ],
      ),
    );
  }

  SizedBox _takeABlank() => const SizedBox(height: 25);
}

class TextSheme extends StatelessWidget {
  const TextSheme({super.key, required this.title});
  final String title; //Stateless bir widget kullanıyosak, en önemli nokta 
  //dışarıdan alınan param. yönetimidir Stateless w.da sonradan değişme diye bişe yok
  //Ya bu nullable olaca(? ile ve tabiki final ile (best practise-zorunluluk)
  //ya da required kullancan he

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
