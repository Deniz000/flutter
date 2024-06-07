import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:demo_pages/recipe-app/recipe_screen.dart';
import 'package:demo_pages/theme/light_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await NotificationController.initializeLocalNotifications();
  // await NotificationController.initializeIsolateReceivePort();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Kisisel bildirim!',
            channelDescription: "kisisel bildirim for learning notifications",
            defaultColor: Colors.blue,
            ledColor: Colors.red)
      ],
      debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme().theme,
      // ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     color: Colors.white,
      //     elevation: 0,
      //   ),
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: const RecipeApp
      (),
    );
  }
}
