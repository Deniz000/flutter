import 'package:ecommerce_app/common/styles/spacing_style.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => Get.offAll(() => const LoginScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            Text(
              subtitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: Sizes.spaceBtwItems),

            /// Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                )),
          ],
        ),
      ),
    );
  }
}
