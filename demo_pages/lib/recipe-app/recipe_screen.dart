import 'package:demo_pages/recipe-app/model/recipe.dart';
import 'package:demo_pages/recipe-app/recipe_detail.dart';
import 'package:demo_pages/recipe-app/service/recipe_service.dart';
import 'package:flutter/material.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  bool isLoading = false;
  late final IRecipeService _recipeService;
  int _currentSelectecItem = 0;
  List<Recipe>? _recipes;
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
      _recipes = await _recipeService.getRecipeList();
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
      body: (_recipes != null)
          ? SizedBox(
              height: double.infinity,
              child: ListView.builder(
                itemCount: _recipes?.length,
                itemBuilder: (context, index) {
                  return ListItemSheme(recipes: _recipes![index]);
                },
              ),
            )
          : const CircularProgressIndicator(),
      // : const CircularProgressIndicator()
    );
  }
}

// ignore: must_be_immutable
class ListItemSheme extends StatefulWidget {
  const ListItemSheme({
    super.key,
    required Recipe recipes,
  }) : _recipe = recipes;

  final Recipe _recipe;

  @override
  State<ListItemSheme> createState() => _ListItemShemeState();
}

class _ListItemShemeState extends State<ListItemSheme>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  RecipeDetail(recipe: widget._recipe,)));
        },
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child:
              Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget._recipe.image,
                  fit: BoxFit.cover,
                )),
           
            Positioned(
                bottom: 50,
                left: 10,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width -
                        70, // Metnin maksimum genişliğini ayarla
                  ),
                  child: Text(
                    widget._recipe.name,
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
                      widget._recipe.rating.toString(),
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
                      widget._recipe.totalTime,
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
      ),
    );
  }
}

Color foodAppSecondary() => const Color.fromARGB(255, 41, 110, 75);
