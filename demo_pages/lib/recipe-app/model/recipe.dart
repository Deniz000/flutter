class Recipe {
  final String name;
  final String image;
  final double rating;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.image,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json["name"],
      image: json["images"][0]["hostedLargeUrl"],
      rating: json["rating"],
      totalTime: json["totalTime"],
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
