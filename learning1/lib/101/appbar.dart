import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});
  final String _welcome = 'This is my App Bitch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_welcome),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.menu)), 
        const Center(child: CircularProgressIndicator(),)],
      ),
    );
  }
}
