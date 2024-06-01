import 'package:flutter/material.dart';
import 'package:learning1/core/random_image.dart';

class ListTileLearn  extends StatelessWidget {
  const ListTileLearn ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rehberim",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.green[700]),),
            const _ListCard(personName: "Melda Hanım",),
            const _ListCard(personName: "Muhtar Bey",),
            const _ListCard(personName: "Bakkal Amca",),
          ],
        ),
      ),
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({
    required this.personName
  });
  final String personName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(personName), 
        // dense: true, olabildiğince sıkıştırıyor, paddingi siliyor 
        subtitle: const Text("öğreniypruz Elhamdülillah"),
        leading: const RandomImage(),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}