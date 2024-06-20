import 'package:ecommerce_app/common/styles/spacing_style.dart';
import 'package:ecommerce_app/common/widgets/t_form_divider.dart';
import 'package:ecommerce_app/common/widgets/t_social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/login/t_login_form.dart';
import 'package:ecommerce_app/features/authentication/screens/login/t_login_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(),
              TLoginForm(),
              TFormDivider(
                dividerText: TTexts.orSignInWith,
              ),
              SizedBox(
                height: Sizes.spaceBtwSections / 2,
              ),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
