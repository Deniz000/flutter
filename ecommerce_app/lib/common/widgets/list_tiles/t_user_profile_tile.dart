import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const TCircularImage(
            image: TImages.google,
            width: 50,
            height: 50,
            padding: 0),
        title: Text('Coding with T',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white)),
        subtitle: Text('support@codingwithT.com',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white)),
                trailing: IconButton(onPressed: ()=> Get.to(()=>const ProfileScreen()), icon: const Icon(Iconsax.edit, color: TColors.white)),);
  }
}
