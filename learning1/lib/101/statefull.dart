import 'package:flutter/material.dart';
import 'package:learning1/101/custom_button.dart';
import 'package:learning1/product/language/language_items.dart';

//dışarıdan al ver işlemlerini burada yapıyoruz, stateless gibi çalışır
class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

//hayatı etkileyen nokta burası, asıl işlemleri logicleri yapacağımız yer
class _StatefullLearnState extends State<StatefullLearn> {
  int count = 0;
  // void incrementValue() {
  //   setState(() {
  //     count++;
  //   });
  // }

  // void deincrementValue() {
  //   setState(() {
  //     count--;
  //   });
  // }

  void _updateCounter(bool increment) {
    return setState(() {
      increment ? count++ : count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LanguageItems.welcome ),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _MathButtons(
            icon: Icons.remove,
            onPressed: () => _updateCounter(false),
          ),
          _MathButtons(
            icon: Icons.add,
            onPressed: () => _updateCounter(true),
          ),
          const CustomButton(),
        ],
      ),
      body: Center(
        child: Text(count.toString()),
      ),
    );
  }
}

class _MathButtons extends StatelessWidget {
  const _MathButtons({
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: () => onPressed(),
        child: Icon(icon),
      ),
    );
  }
}
