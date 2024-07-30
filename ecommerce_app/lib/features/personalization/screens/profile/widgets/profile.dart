import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/t_profile_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.facebook,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(TTexts.changeProfilePicture))
                  ],
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              const TSectionHeader(
                title: TTexts.profileInformation,
                showActionButton: false,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              TProfileMenu(
                title: 'Name',
                value: 'Coding with T',
                onPressed: () {},
              ),
              TProfileMenu(
                  title: 'Username', value: 'coding_with_t', onPressed: () {}),
              const SizedBox(height: Sizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeader(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              TProfileMenu(
                  title: 'User ID',
                  value: '45689',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail', value: 'coding_with_t', onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: '+92-317-8059528',
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '10 Oct, 1994',
                  onPressed: () {}),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ), // TextButton
              ), // Center
            ],
          ),
        ),
      ),
    );
  }
}
