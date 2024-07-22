import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TGridView extends StatelessWidget {
  const TGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.gridViewSpacing,
            crossAxisSpacing: Sizes.gridViewSpacing,
            childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.34 ),
            ),
        itemCount: 4,
        itemBuilder: (_, index) => const TProductCardVertical());
  }
}
