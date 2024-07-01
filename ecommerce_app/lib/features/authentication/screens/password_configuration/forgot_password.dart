import 'package:ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            /// Headings
            Text(TTexts.forgetPassword,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: Sizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: Sizes.spaceBtwSections * 2),

            /// Text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),

            /// Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(()=> const ResetPasswordScreen()), child: const Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}
