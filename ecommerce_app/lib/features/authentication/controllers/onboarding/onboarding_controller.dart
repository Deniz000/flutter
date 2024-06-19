import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController instance = Get.find();

  // Update Current Index when Page Scroll
void updatePageIndicator (index) {}
/// Jump to the specific dot selected page.
void dotNavigationClick(index) {}
/// Update Current Index & jump to next page
void nextPage() {}
/// Update Current Index & jump to the last Page
void skipPage() {}
}
