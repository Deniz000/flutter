import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/shop/screens/card/t_cart_item.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title:
                Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
        body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: Sizes.spaceBtwSections),
                itemCount: 4,
                itemBuilder: (_, __) => const TCartItem())),
                bottomNavigationBar: ElevatedButton(onPressed: (){}, child: const Text('Checkout  \$956')),);
  }
}
