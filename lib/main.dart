import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:samachar/Screens/Authenticate/Register/otp_screen.dart';
import 'package:samachar/Screens/Authenticate/Register/register.dart';
import 'package:samachar/Screens/Authenticate/SignIn/sign_in.dart';
import 'package:samachar/Screens/Authenticate/authenticate.dart';
import 'package:samachar/Screens/Authenticate/welcome_screen.dart';
import 'package:samachar/Screens/Home/category_wise_news.dart';
import 'package:samachar/Screens/Home/home.dart';
import 'package:samachar/Screens/Home/mews.dart';
import 'package:samachar/Screens/Home/multiple_category_news.dart';
import 'package:samachar/Screens/Home/news_subscription_page.dart';
import 'package:samachar/Screens/Home/newspaper.dart';
import 'package:samachar/Screens/Home/profile.dart';
import 'package:samachar/Screens/Home/settings_form.dart';
import 'package:samachar/Screens/Home/single_category_news.dart';
import 'package:samachar/Screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Services/auth.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:samachar/Services/news_service.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:samachar/Services/database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthService _auth = AuthService();
  return runApp(
    MultiProvider(
      providers : [
       ChangeNotifierProvider(create: (context) => AuthService()),

       ChangeNotifierProvider(create: (context) => DatabaseService(uid: _auth.currentUser()!.uid)),
        
      ],
      child: MyApp(),
    )
    //MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return MaterialApp(
        //initialRoute: '/',
        routes: {
          //'/': (context) => Wrapper(),
          '/WelcomeScreen': (context) => WelcomeScreen(),
          '/SignIn': (context) => auth.loggedIn ? Home() : SignIn(),
          '/Register': (context) => Register(),
          '/Home': (context) => auth.loggedIn ? Home() : SignIn(),
          '/Mews': (context) => Mews(),
          '/SingleCategory': (context) => SingleCategory(urlNews: ' '),
          '/MultipleCategory': (context) => MultipleCategory(),
          '/NewsPaper': (context) => NewsPaper(),
          '/Profile': (context) => Profile(),
          '/CategoryWiseNews': (context) => CategoryWiseNews(),
          '/SettingsForm' : (context) => SettingsForm(),
          '/NewsSubscriptionPage' : (context) => NewsSubscriptionPage(),
        },
        home: auth.loggedIn ? Home() : SignIn(),
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
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      
    );
  }
}


      