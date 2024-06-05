import 'package:demo_pages/onboardings/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  late final List<OnBoardItem> _onBoardItem;
  @override
  void initState() {
    super.initState();
    _onBoardItem = OnBoardItem.getOnBoardItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        body: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _onBoardItem.length,
          itemBuilder: (context, index) {
            return PageItems(onBoardItem: _onBoardItem[index]);
          },
        ),
        bottomSheet: Container(
          color: const Color.fromARGB(255, 236, 236, 236),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: _onBoardItem.length,
                  effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                        borderRadius: BorderRadius.circular(20),
                        verticalOffset: 3,
                        rotationAngle: 5,
                        color: Colors.blue,
                        height: 13,
                        width: 13),
                    activeDotDecoration: DotDecoration(
                        borderRadius: BorderRadius.circular(20),
                        rotationAngle: 4,
                        verticalOffset: 0,
                        color: const Color.fromARGB(255, 3, 54, 131),
                        height: 15,
                        width: 15),
                  )),
              TextButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  child: const Text(
                    "next",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ));
  }
}

class PageItems extends StatelessWidget {
  const PageItems(
      {super.key, required OnBoardItem onBoardItem})
      : _onBoardItem = onBoardItem;

  final OnBoardItem _onBoardItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(_onBoardItem.imagesPath),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              _onBoardItem.header,
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w600,
                letterSpacing: -2,
                shadows: [Shadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))],
                color:  Color.fromARGB(255, 3, 54, 131),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            _onBoardItem.description,
            style: const TextStyle(
                color: Colors.black,
                shadows: [Shadow(color: Colors.black, blurRadius: 3, offset: Offset(0, 0))],
                fontSize: 20,
                letterSpacing: -1,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
