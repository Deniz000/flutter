import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});
  final String data = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(width: MediaQuery.of(context).size.width, child: _CustomButton(data: data)),
              ), 
            _CustomButton(data: data)]));
  }
}

class _CustomButton extends StatelessWidget with _PaddingValues{
  _CustomButton({
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: _ColorsUtility().buttonBackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {},
      child: Padding(
        padding: paddingX,
        child: Text(data,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: _ColorsUtility().buttonText)),
      ),
    );
  }
}

mixin class _PaddingValues {
  final EdgeInsets paddingX = const EdgeInsets.all(6.0);
  final EdgeInsets padding2X = const EdgeInsets.all(12.0);
}

class _ColorsUtility {
  final Color buttonText = Colors.white;
  final Color buttonBackground = const Color.fromARGB(255, 24, 156, 28);
}
