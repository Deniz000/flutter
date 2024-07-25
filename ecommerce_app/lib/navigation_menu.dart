import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
   NavigationMenu({super.key});

  final a = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darMode ? TColors.dark : Colors.white,
          indicatorColor: darMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedItem.value,
          onDestinationSelected: (value) =>
              controller.selectedItem.value = value,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Whislist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedItem.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedItem = 0.obs; //observer variable

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.orange,
    )
  ];
}
