import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Screens/Home/home.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/database.dart';

class NotificationNews extends StatefulWidget {
  NotificationNews({Key? key}) : super(key: key);
  //final String title;

  @override
  _NotificationNewsState createState() => _NotificationNewsState();
}

class _NotificationNewsState extends State<NotificationNews> {


  AuthService _auth = AuthService();
  String title = 'sports';
  String endpoint = 'sports';
  
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  Future<void> saaraMasala() async{
    final customUserData = Provider.of<DatabaseService>(context);
    await customUserData.getData(_auth.currentUser()!.uid);

    ///Gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
        Navigator.of(context).pushNamed('/$routeFromMessage', arguments: {
          'title': customUserData.mappedDoc['newsSubscription'],
          'category_endpoint': customUserData.mappedDoc['newsSubscription'],
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
        'title': customUserData.mappedDoc['newsSubscription'],
        'category_endpoint': customUserData.mappedDoc['newsSubscription'],
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //final customUserData = Provider.of<DatabaseService>(context);

    return FutureBuilder(
      future: saaraMasala(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          // setState(() {
          //   title = customUserData.mappedDoc['newsSubscription'];
          //   endpoint = customUserData.mappedDoc['newsSubscription'];
          // });
          return Home();
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
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
