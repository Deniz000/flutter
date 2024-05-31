import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePathEnums.whale.toWidget(heigth: 100),
    );
  }
}

enum ImagePathEnums {
  // ignore: constant_identifier_names
  whale
}

extension ImagePathExtension on ImagePathEnums {
  String path() {
    return 'assets/$name.jpeg';
  }

  Widget toWidget({double heigth = 50}) {
    return Image.asset(path(),
    height: heigth,);
  }
}
