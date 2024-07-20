import 'package:ecommerce_app/common/widgets/image_text_widgets/t_vertical_image_text.dart';
import 'package:flutter/material.dart';

class THomecategories extends StatelessWidget {
  const THomecategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap:
            true, // widget or layout to adjust its size based on its content.
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
