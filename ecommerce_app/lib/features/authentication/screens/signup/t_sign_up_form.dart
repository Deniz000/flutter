import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Form(
        child: Column(children: [
      Row(children: [
        Expanded(
          child: TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
          ),
        ),
        const SizedBox(
          width: Sizes.spaceBtwInputFields,
        ),
        Expanded(
          child: TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
          ),
        ),
      ]),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.user_edit), labelText: TTexts.userName),
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: TTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash)),
      ),
      const SizedBox(height: Sizes.spaceBtwInputFields / 2),
      Row(children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: true,
              onChanged: (value) {},
            )),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privocyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? Colors.white : TColors.primary,
                  )),
          TextSpan(
              text: TTexts.and, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? Colors.white : TColors.primary,
                  )),
        ])), // Text.rich
      ]),
      const SizedBox(
        height: Sizes.spaceBtwInputFields / 2,
      ),
      SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: const Text(TTexts.createAccount))),
    ]));
  }
}
