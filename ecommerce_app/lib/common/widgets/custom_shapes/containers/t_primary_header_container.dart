import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_circular_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/t_curved_edges_widget.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        padding: EdgeInsets.zero,
        color: TColors.primary,
        height: 300,
        child: Stack(
          children: [
            //Background custom shape
            Positioned(
                top: -100,
                right: -150,
                child: TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(
              top: 100,
              right: -200,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.3),
                padding: 90,
              ),
            ),
            Positioned.fill(child: child),
          ],
        ),
      ),
    );
  }
}
