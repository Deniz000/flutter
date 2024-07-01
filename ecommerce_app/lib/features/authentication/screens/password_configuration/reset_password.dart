import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.clear))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: Column(children: [
                  Image(
                      image: const AssetImage(TImages.verifyEmailImage),
                      width: THelperFunctions.screenHeight() * 0.3),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  /// Title & SubTitle
                  Text(TTexts.changeYourPassmordTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Text(TTexts.changeYourPasswordSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  /// Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(TTexts.done)),
                  ), // SizedBox
                  const SizedBox(height: Sizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(TTexts.resendEmail)),
                  ),
                ]))));
  }
}
