import 'package:demo_pages/recipe-app/model/recipe.dart';
import 'package:demo_pages/recipe-app/service/recipe_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  bool isLoading = false;
  late final IRecipeService _recipeService;
  int _currentSelectecItem = 0;
  late final List<Recipe>? _recipes;
  @override
  void initState() {
    super.initState();
    _recipeService =
        RecipeService('c29be60dd5msh2720c960be2275bp187898jsndb1c74097491');
    fetchRecipe();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchRecipe() async {
    changeLoading();
    try {
      print("girdi");
      _recipes = await _recipeService.getRecipeList();
      print("çıktı");
      setState(() {});
    } catch (e) {
      print('Error fetching recipes: $e');
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_open_outlined),
          title: const Text("Recipes"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelectecItem,
          onTap: (value) {
            setState(() {
              _currentSelectecItem = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorilerim"),
            BottomNavigationBarItem(
                icon: Icon(Icons.kitchen), label: "Siparişlerim"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
        body: (_recipes != null && _recipes.isNotEmpty)
            ? Container(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    return ListItemSheme(recipes: _recipes[index]);
                  },
                ),
              )
            : const CircularProgressIndicator());
  }
}

// ignore: must_be_immutable
class ListItemSheme extends StatefulWidget {
  ListItemSheme({
    super.key,
    required Recipe recipes,
  }) : _recipes = recipes;

  final Recipe _recipes;

  @override
  State<ListItemSheme> createState() => _ListItemShemeState();
}

class _ListItemShemeState extends State<ListItemSheme>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(microseconds: 1));
  }


  bool bookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget._recipes.image,
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 2,
            right: 1,
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
                  "https://lottie.host/3b33812b-001b-40a6-a086-a40caeea0a74/rqsTnR1hru.json"),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 10,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width -
                      70, // Metnin maksimum genişliğini ayarla
                ),
                child: Text(
                  widget._recipes.name,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.black54, offset: Offset(1, 1))
                      ]),
                ),
              )),
          Positioned(
              bottom: 25,
              left: 10,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    widget._recipes.rating.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.black54, offset: Offset(1, 1))
                        ]),
                  ),
                ],
              )),
          Positioned(
              bottom: 25,
              right: 10,
              child: Row(
                children: [
                  Text(
                    widget._recipes.totalTime,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.black54, offset: Offset(1, 1))
                        ]),
                  ),
                  const Icon(
                    Icons.hourglass_bottom_rounded,
                    color: Colors.yellow,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

Color foodAppSecondary() => const Color.fromARGB(255, 41, 110, 75);
