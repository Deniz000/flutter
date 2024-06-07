import 'package:demo_pages/recipe-app/model/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;
  @override
  State<RecipeDetail> createState() => RecipeDetailState();
}

class RecipeDetailState extends State<RecipeDetail>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool bookmarked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(3, 3),
                          blurRadius: 3)
                    ]),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Image.network(
                    widget.recipe!.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    if (bookmarked) {
                      _controller.reverse();
                      bookmarked = !bookmarked;
                    } else {
                      _controller.forward();
                      bookmarked = !bookmarked;
                    }
                  },
                  child: Lottie.network(
                      controller: _controller,
                      "https://lottie.host/3b33812b-001b-40a6-a086-a40caeea0a74/rqsTnR1hru.json",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe!.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                        shadows: [
                          Shadow(color: Colors.black45, offset: Offset(1, 1))
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        (FontAwesomeIcons.receipt),
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.recipe!.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.done_outline_rounded,
                            size: 20, color: Colors.green[800]),
                        title: Text(
                          widget.recipe?.ingredients[index] ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
