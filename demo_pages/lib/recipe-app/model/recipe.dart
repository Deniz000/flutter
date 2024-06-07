class Recipe {
  final String name;
  final String image;
  final double rating;
  final String totalTime;
  final List<String> ingredients;

  Recipe(
      {required this.name,
      required this.image,
      required this.rating,
      required this.totalTime,
      required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<String> inIngredient = [];
    for (var i in json["ingredientLines"]) {
      inIngredient.add(i["ingredient"]);
    }
    return Recipe(
      name: json["details"]["name"],
      image: json["details"]["images"][0]["hostedLargeUrl"],
      rating: json["details"]["rating"],
      totalTime: json["details"]["totalTime"],
      ingredients: inIngredient,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["image"] = image;
    data["rating"] = rating;
    data["totalTime"] = totalTime;
    return data;
  }
}
