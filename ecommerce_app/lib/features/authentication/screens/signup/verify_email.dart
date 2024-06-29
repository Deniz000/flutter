import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.sendedEmail),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Text('support@codingwitht.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(TTexts.confirmEmailtSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    Get.to(() => SuccessScreen(
                      image: TImages.verifyEmailImage,
                      title: TTexts.yourAccountCreatedTitle,
                      subtitle: TTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(()=>const LoginScreen()),
                    ));
                    },
                    child: const Text(TTexts.tContinue),
                  )),
              const SizedBox(height: Sizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
