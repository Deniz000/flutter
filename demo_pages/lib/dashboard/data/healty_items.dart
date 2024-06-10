import 'package:demo_pages/dashboard/model/healty_model.dart';

class HealtyDetails {
  final details = [
    HealtyModel(
        icon:
            "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/dashboard/assets/fire.png",
        value: "305",
        title: "Calories burned"),
    HealtyModel(
        icon: "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/dashboard/assets/footsteps.png",
        value: "10.905",
        title: "Steps"),
    HealtyModel(
        icon: "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/dashboard/assets/route.png",
        value: "9km",
        title: "Distances"),
    HealtyModel(
        icon: "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/dashboard/assets/cloudy-night.png",
        value: "7h48m",
        title: "Sleep"),
  ];

  String get path =>
      "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/dashboard/assets/fire.png";
}
