import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TGridView extends StatelessWidget {
  const TGridView({
    super.key, required this.itemBuilder, required this.itemCount, this.mainAxisExtent = 288,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: Sizes.gridViewSpacing,
          crossAxisSpacing: Sizes.gridViewSpacing,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.34),
        ),
        itemCount: itemCount,
        itemBuilder:itemBuilder);
  }
}
