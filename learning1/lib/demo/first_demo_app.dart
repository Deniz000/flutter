import 'package:flutter/material.dart';

class FirstDemoApp extends StatelessWidget {
  const FirstDemoApp({super.key});

  final String header = "Create your first note";
  final String lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  final String createANote = "Create A Note";
  final String textButton = "don't have a account ?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green[100],
      body: Padding(
        padding: PaddingValues().pageHorizontalPadding +
            PaddingValues().pageVerticalPadding,
        child: Column(
          children: [
            Image.asset(_getPathName),
            _withContainer(
              TextValues(
                text: header,
                theme: Theme.of(context)
                    .copyWith()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            TextValues(
              text: lorem,
              theme:
                  Theme.of(context).copyWith().textTheme.labelSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
              textAlign: TextAlign.center,
            ),
            _withContainer(_ButtonStyle(
              createANote: createANote,
            )),
            TextButton(
              onPressed: () {},
              child: Text(textButton),
            )
          ],
        ),
      ),
    );
  }

  Container _withContainer(Widget widget) {
    return Container(
      margin: PaddingValues().widgetVerticalPadding,
      child: widget,
    );
  }

//Theme.of(context).copyWith().textTheme.headlineLarge)
  String get _getPathName =>
      "/Users/guldenizozdemir/flutter_learn_process/start_week/learning1/assets/pic.png";
}

class _ButtonStyle extends StatelessWidget {
  const _ButtonStyle({required this.createANote});
  final String createANote;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: SizedBox(height: 50, child: Center(child: Text(createANote))),
    );
  }
}

class TextValues extends StatelessWidget {
  const TextValues({super.key, required this.text, this.theme, this.textAlign});
  final String text;
  final TextStyle? theme;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: theme,
      textAlign: textAlign,
    );
  }
}

class ProjectText {}

class PaddingValues {
  final EdgeInsets pageHorizontalPadding =
      const EdgeInsets.symmetric(horizontal: 40);
  final EdgeInsets pageVerticalPadding =
      const EdgeInsets.symmetric(vertical: 5);

  final EdgeInsets widgetHorizontalPadding =
      const EdgeInsets.symmetric(horizontal: 40);
  final EdgeInsets widgetVerticalPadding =
      const EdgeInsets.symmetric(vertical: 15);
}
