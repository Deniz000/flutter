import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}


class _CustomButtonState extends State<CustomButton> {
int count = 0;
void increase() {
  setState(() {
      count++;

  });
}
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increase,
      child: Text(count.toString()),
    );
  }
}
