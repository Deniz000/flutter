import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('evet bu bir başlık gardaşım'),
      ),
      body: const Text('ay çok hoşuma gitti yaa'),
      drawer: const Drawer(),
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'aa'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'bb'),
          ],
      ),
    );
  }
}
