import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:demo_pages/learn_provider/home_page.dart';
import 'package:demo_pages/learn_provider/user_view_model.dart';
import 'package:demo_pages/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserViewModel())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,
          home: const HomePage(),
        ));
    
  }
}
