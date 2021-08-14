import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:samachar/Screens/Home/home.dart';

class NotificationNews extends StatefulWidget {
  NotificationNews({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NotificationNewsState createState() => _NotificationNewsState();
}

class _NotificationNewsState extends State<NotificationNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///Gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
        Navigator.of(context).pushNamed('/$routeFromMessage', arguments: {
          'title': "Business",
          'category_endpoint': 'business',
        });
      }
    });

    ///foreground
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.body);
      print(message.notification!.title);

      LocalNotificationService.display(message);
    });

    /// When the app is in background but opened and user taps on it
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      print(routeFromMessage);
      Navigator.of(context).pushNamed('/$routeFromMessage', arguments: {
        'title': "Business",
        'category_endpoint': 'business',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecondsSinceEpoch ~/1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
              "samachar", "samachar channel", "This is our channel",
              importance: Importance.max, priority: Priority.high));

      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails);
    } catch (e) {
      print(e.toString()); 
    }
  }
}
