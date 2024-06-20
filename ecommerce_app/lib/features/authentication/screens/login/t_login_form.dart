import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
            textAlignVertical: TextAlignVertical.center,
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffix: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(TTexts.rememberMe)
                ],
              ),
              TextButton(
                child: const Text(TTexts.forgetPassword),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields / 2,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(TTexts.signIn))),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text(TTexts.createAccount))),
        ],
      ),
    ));
  }
}
