import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  late AnimationController _animationController;
  bool _isVisiable = false;
  bool _isOpasity = false;

  void _changeVisibility() {
    setState(() {
      _isVisiable = !_isVisiable;
    });
  }

  void _changeOpasity() {
    setState(() {
      _isOpasity = !_isOpasity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeVisibility();
            _animationController.animateTo(_isVisiable ? 1 : 0);
          },
        ),
        body: Column(
          children: [
            //AnimatedCrosFade iki widget arasında bi animasyon uygular
            //burada önemli olan nokta bu
            _animatedOpasity(),
            _animatedCrossFade(),
            _animatedDefaultTextStyle(context),
            _animatedIcon(),
            //kendi içerisinde her şeyi animasyon ile yapıyor
            _animatedConteiner(context),
            Expanded(
              child: AnimatedList(
                initialItemCount: 4,
                itemBuilder: (context, index, animation) {
                  return const Text("Ben list");
                },
              ),
            )
          ],
        ));
  }

  AnimatedContainer _animatedConteiner(BuildContext context) {
    return AnimatedContainer(
      duration: _DurationItems.durationLow,
      height: _isVisiable ? kZero : (MediaQuery.of(context).size.width) * 0.2,
      width: (MediaQuery.of(context).size.height) * 0.2,
      color: Colors.blue,
    );
  }

  AnimatedIcon _animatedIcon() {
    return AnimatedIcon(
        icon: AnimatedIcons.play_pause, progress: _animationController);
  }

  AnimatedDefaultTextStyle _animatedDefaultTextStyle(BuildContext context) {
    return AnimatedDefaultTextStyle(
        style: (_isVisiable
                ? context.textTheme().displayLarge
                : context.textTheme().labelLarge) ??
            const TextStyle(),
        duration: _DurationItems.durationLow,
        child: const Text("data"));
  }

  ListTile _animatedOpasity() {
    return ListTile(
      title: AnimatedOpacity(
          duration: _DurationItems.durationLow,
          opacity: _isOpasity ? 1 : 0,
          child: const Text("I'm here,")),
      trailing: IconButton(
          onPressed: () {
            _changeOpasity();
          },
          icon: const Icon(Icons.slideshow_sharp)),
    );
  }

  AnimatedCrossFade _animatedCrossFade() {
    return AnimatedCrossFade(
      firstChild: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
      secondChild: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      ),
      duration: _DurationItems.durationLow,
      crossFadeState:
          _isVisiable ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
