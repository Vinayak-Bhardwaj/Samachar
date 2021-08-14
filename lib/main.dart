import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:samachar/Screens/Authenticate/Register/register.dart';
import 'package:samachar/Screens/Authenticate/SignIn/sign_in.dart';
import 'package:samachar/Screens/Home/category_wise_news.dart';
import 'package:samachar/Screens/Home/home.dart';
import 'package:samachar/Screens/Home/mews.dart';
import 'package:samachar/Screens/Home/multiple_category_news.dart';
import 'package:samachar/Screens/Home/news_subscription_page.dart';
import 'package:samachar/Screens/Home/newspaper.dart';
import 'package:samachar/Screens/Home/profile.dart';
import 'package:samachar/Screens/Home/settings_form.dart';
import 'package:samachar/Screens/Home/single_category_news.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Services/auth.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:samachar/Services/database.dart';
import 'package:samachar/Services/notification.dart';
import 'Screens/wrapper.dart';


///Receive message when the app is in background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  AuthService _auth = AuthService();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => DatabaseService(uid: _auth.currentUser()!.uid)),
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/SignIn': (context) => auth.loggedIn ? Home() : SignIn(),
        '/Register': (context) => auth.loggedIn ? NewsSubscriptionPage() : Register(),
        '/Home': (context) => auth.loggedIn ? Home() : SignIn(),
        '/Mews': (context) => Mews(),
        '/SingleCategory': (context) => SingleCategory(urlNews: ' '),
        '/MultipleCategory': (context) => MultipleCategory(),
        '/NewsPaper': (context) => NewsPaper(),
        '/Profile': (context) => Profile(),
        '/CategoryWiseNews': (context) => CategoryWiseNews(),
        '/SettingsForm': (context) => SettingsForm(),
        '/NewsSubscriptionPage': (context) => NewsSubscriptionPage(),
      },
      //home: auth.loggedIn ? Home() : SignIn(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
      ),
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
        const Locale('el'),
        const Locale('nb'),
        const Locale('nn'),
        const Locale('pl'),
        const Locale('pt'),
        const Locale('ru'),
        const Locale('hi'),
        const Locale('ne'),
        const Locale('uk'),
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
