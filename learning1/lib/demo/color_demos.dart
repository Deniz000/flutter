//bir ekran olacak
//bu ekranda 3 button olacak, bunlara basınca renk değişimi (değişim=> hayat var)
//olacak, secili olan button selected icon olsun
import 'package:flutter/material.dart';

class ColorsDemo extends StatefulWidget {
  ColorsDemo({super.key, this.initialColor});
  final Color? initialColor;

  @override
  State<ColorsDemo> createState() => _ColorsDemoState();
}

class _ColorsDemoState extends State<ColorsDemo> {
  Color _backgroundColor = Colors.transparent;

  @override
  void didUpdateWidget(covariant ColorsDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  void onTapMethod(int value) {
    switch (value) {
      case 0:
        changeBackgroundColor(Colors.red);
        break;
      case 1:
        changeBackgroundColor(Colors.orange);
        break;
      case 2:
        changeBackgroundColor(Colors.yellow);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapMethod,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.red,
              ),
              label: "Red"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.orange,
              ),
              label: "orange"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.yellow,
              ),
              label: "orange"),
        ],
      ),
    );
  }
}

