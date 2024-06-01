import 'package:flutter/material.dart';

class NavigateDetail extends StatefulWidget {
  const NavigateDetail({super.key});

  @override
  State<NavigateDetail> createState() => _NavigateDetailState();
}

class _NavigateDetailState extends State<NavigateDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.check),
          label: const Text("Onayla"),
        ),
      ),
    );
  }
}
