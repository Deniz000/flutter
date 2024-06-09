import 'package:demo_pages/recipe-app/model/recipe.dart';
import 'package:demo_pages/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;
  @override
  State<RecipeDetail> createState() => RecipeDetailState();
}

class RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Text(
              '${widget.recipe?.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.network(widget.recipe!.image, fit: BoxFit.cover)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                      color: LightThemeColor.foodAppYellow,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Text('${widget.recipe?.ingredients[index]}');
                  }),
                ),
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            title: Text(
              'Step ${index + 1}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              steps[index],
            ),
          );
        }, childCount: steps.length))
      ],
    ));
  }
}

List<String> steps = [
  "Preheat the oven to 325 degrees F (165 degrees C). Sift cake flour, baking powder, and 1 teaspoon salt together in a bowl.",
  "Combine egg whites and cream of tartar in a large bowl. Beat on medium speed with an electric mixer until mixture forms soft peaks. With the mixer running, gradually pour in 1/2 cup of the granulated sugar, 1 tablespoon at a time, and continue beating until mixture forms stiff, glossy peaks, 3 to 5 minutes. Set aside.",
  "In another bowl, add egg yolks and remaining 1 1/4 cups sugar. Beat until mixture has increased in volume and lightened in color, 3 to 5 minutes. Add in 3/4 cup limoncello, olive oil, 1/4 cup heavy cream, 2 tablespoons lemon juice, 1 1/2 tablespoons lemon zest, and vanilla and mix until thoroughly combined.",
  "Pour in 1/2 of the sifted cake flour mixture and mix until just combined. Add in remaining flour mixture plus 1 tablespoon poppy seeds and mix on low speed until just combined. Add in 1/3 of the whipped egg whites, and gently fold in until no streaks of white remain. Add in remaining egg whites and fold gently until no streaks of white remain.",
  "Place an ungreased 10-inch tube pan with removable bottom onto a baking sheet. Pour batter evenly into the tube pan.",
  "Bake in the preheated oven until top of the cake begins to turn golden and feels mostly set, 55 to 65 minutes. Remove pan from oven and invert onto a wire rack to cool completely, about 90 minutes.",
];
