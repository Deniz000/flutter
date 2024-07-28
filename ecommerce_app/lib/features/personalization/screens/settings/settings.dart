import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/t_user_profile_tile.dart';
import 'package:ecommerce_app/common/widgets/text/t_section_header.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              TAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                  showBackArrow: false),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              const TUserProfileTile(),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(children: [
              const TSectionHeader(
                title: 'Account Settings',
                showActionButton: false,
              ),
              const SettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subTitle: 'Set shopping delivery address'),
              const SettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subTitle: 'Add, remove products and move to checkout'),
              const SettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subTitle: 'In-progress and Completed Orders'),
              const SettingsMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'Withdraw balance to registered bank account'),
              const SettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subTitle: 'List of all the discounted coupons'),
              const SettingsMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subTitle: 'Set any kind of notification message'),
              const SettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subTitle: 'Manage data usage and connected accounts'),
              const SizedBox(height: Sizes.spaceBtwSections),
              const TSectionHeader(
                  title: 'App Settings', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              const SettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Load Data',
                  subTitle: 'Upload Data to your Cloud Firebase'),

              SettingsMenuTile(
                icon: Iconsax.security_user,
                title: 'Geolocation',
                subTitle: 'Set recommendation based on location',
                trailing: Switch(value: false, onChanged: (value) {}),
              ), // Settin
              SettingsMenuTile(
                icon: Iconsax.security_user,
                title: 'Safe Mode',
                subTitle: 'Search result is safe for all ages',
                trailing: Switch(value: false, onChanged: (value) {}),
              ), // SettingsMenuTile
              SettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {})),
            ]),
          ),
        ]),
      ),
    );
  }
}
