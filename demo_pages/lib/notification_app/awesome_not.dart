import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationLearn extends StatefulWidget {
  const AwesomeNotificationLearn({super.key});

  @override
  State<AwesomeNotificationLearn> createState() =>
      AwesomeNotificationLearnState();
}

class AwesomeNotificationLearnState extends State<AwesomeNotificationLearn> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            triggerNotification();
          },
          child: const Text("Trigger Not"),
        ),
      ),
    );
  }

  void triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: "Hey!",
      body: "It's mee!",
      actionType: ActionType.KeepOnTop
    ),
    actionButtons:[ NotificationActionButton(
      key: "reply", label: "reply",
      autoDismissible: true,
      enabled: true,
      actionType: ActionType.SilentAction)]);
  }
}
