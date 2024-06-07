import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:demo_pages/recipe-app/model/recipe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

abstract class IRecipeService {
  Future<List<Recipe>?> getRecipeList();
}

class RecipeService extends IRecipeService {
  final apiKey = 'c29be60dd5msh2720c960be2275bp187898jsndb1c74097491';

  var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list", {
    "limit": "24",
    "start": "0",
  });

  @override
  Future<List<Recipe>?> getRecipeList() async {
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": apiKey,
      "x-rapidapi-host": "yummly2.p.rapidapi.com"
    });
    if (response.statusCode != HttpStatus.ok) {
      throw const NoResultFoundException();
    }
    Map<dynamic, dynamic> datas = jsonDecode(response.body);
    List<Recipe> recipes = [];

    if (datas["feed"] is List) {
      for(var item in datas["feed"]) {
      recipes.add(Recipe.fromJson(item["content"]["details"]));
      }
    }
    // List<String> recipes = [];
    // for (var i in datas["feed"]) {
    //   recipes.add(i["content"]["details"]);
    // }
    return recipes;
  }
}
