import 'package:ecommerce_app/common/widgets/t_form_divider.dart';
import 'package:ecommerce_app/common/widgets/t_social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/t_sign_up_form.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.singupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              const TSignUpForm(),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              const TFormDivider(dividerText: TTexts.orSignInWith),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),

              /// Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
