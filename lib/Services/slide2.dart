// import 'package:algolia/algolia.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:user/provider/authProvider.dart';
// import 'package:user/provider/category_provider.dart';
// import 'package:user/provider/grocery_provider.dart';
// import 'package:user/provider/offer_provider.dart';
// import 'package:user/provider/products_provider.dart';
// import 'package:user/provider/promotion_provider.dart';
// import 'package:user/provider/userProvider.dart';
// import 'package:user/ui/common/future_error_builder.dart';
// import 'package:user/ui/common/splash_screen.dart';
// import 'package:user/ui/home/home.dart';
// import 'package:user/ui/login/LoginScreen.dart';
// import 'package:user/ui/walkthrough/walkthrough_screen.dart';
// import 'package:user/utils/ApiKeys.dart';
// import 'package:user/utils/AppSizes.dart';
// import 'package:user/utils/routes.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:user/ui/task_list/buying_list_share.dart';

// void main() => runApp(EasyLocalization(
//     supportedLocales: [Locale('en'), Locale('en', 'US'), Locale('pt')],
//     path: 'assets/translations',
//     // <-- change patch to your
//     fallbackLocale: Locale('en', 'US'),
//     saveLocale: true,
//     child: MyApp()));

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Future<FirebaseApp> _firebaseInitFuture;

//   @override
//   void initState() {
//     super.initState();
//     _firebaseInitFuture = Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AuthProvider>(
//           create: (_) => AuthProvider(),
//         ),
//         ChangeNotifierProvider<UserProvider>(
//           create: (_) => UserProvider(),
//         ),
//         ChangeNotifierProvider<CategoryProvider>(
//           create: (_) => CategoryProvider(),
//         ),
//         ChangeNotifierProvider<ProductsProvider>(
//           create: (_) => ProductsProvider(),
//         ),
//         ChangeNotifierProvider<GroceryProvider>(
//           create: (_) => GroceryProvider(),
//         ),
//         ChangeNotifierProvider<OfferProvider>(
//           create: (_) => OfferProvider(),
//         ),
//         ChangeNotifierProvider<PromotionProvider>(
//           create: (_) => PromotionProvider(),
//         )
//       ],
//       child: MaterialApp(
//         title: 'My Promo',
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         localizationsDelegates: context.localizationDelegates,
//         theme: ThemeData(
//           primarySwatch: Colors.deepOrange,
//         ),
//         home: FutureBuilder(
//             future: _firebaseInitFuture,
//             builder: (_, snapshot) {
//               if (snapshot.hasError)
//                 return Scaffold(body: FutureBuilderErrorWidget(snapshot));
//               if (snapshot.connectionState == ConnectionState.waiting)
//                 return SplashScreen();
//               return App();
//             }),
//       ),
//     );
//   }
// }

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   void initDynamicLinks() async {
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData dynamicLink) async {
//       final Uri deepLink = dynamicLink?.link;

//       if (deepLink != null) {
//         if (deepLink.pathSegments.length == 4) {
//           if (deepLink.pathSegments[0] == "user") {
//             var userId = deepLink.pathSegments[1];
//             if (deepLink.pathSegments[2] == "buyinglist") {
//               var listId = deepLink.pathSegments[3];
//               final auth = Provider.of<AuthProvider>(context, listen: false);
//               if(auth.isInitialised && auth.isAuthenticated){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => ShareBuyingList(userId: userId, listId: listId, isLoggedIn: false)));
//               } else if(auth.isInitialised && !auth.isAuthenticated){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => ShareBuyingList(userId: userId, listId: listId, isLoggedIn: false)));

//               }
//             }
//           }
//         }
//       }
//     }, onError: (OnLinkErrorException e) async {
//       print('onLinkError');
//       print(e.message);
//     });

//     final PendingDynamicLinkData data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     final Uri deepLink = data?.link;

//     if (deepLink != null) {
//         if (deepLink.pathSegments.length == 4) {
//           if (deepLink.pathSegments[0] == "user") {
//             var userId = deepLink.pathSegments[1];
//             if (deepLink.pathSegments[2] == "buyinglist") {
//               var listId = deepLink.pathSegments[3];
//               final auth = Provider.of<AuthProvider>(context, listen: false);
//               if(auth.isInitialised && auth.isAuthenticated){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => ShareBuyingList(userId: userId, listId: listId, isLoggedIn: false)));
//               } else if(auth.isInitialised && !auth.isAuthenticated){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => ShareBuyingList(userId: userId, listId: listId, isLoggedIn: false)));

//               }
//             }
//           }
//         }
//       }
//   }

//   @override
//   void initState() {
//     super.initState();
//     initDynamicLinks();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<AuthProvider>(context);
//     return MaterialApp(
//       title: 'MyPromo',
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       localizationsDelegates: context.localizationDelegates,
//       theme: ThemeData(
//           primarySwatch: Colors.deepOrange,
//           appBarTheme: AppBarTheme(
//             color: Colors.white,
//             elevation: 0,
//             iconTheme: IconThemeData(color: Colors.black),
//             textTheme: TextTheme(
//               headline6: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontSize: AppSizes.textSizeAppBar,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w700),
//             ),
//           ),
//           textTheme: TextTheme(
//               caption: TextStyle(fontFamily: 'Montserrat'),
//               headline6: TextStyle(fontFamily: 'Montserrat'))),
//       home: auth.isInitialised
//           ? auth.isAuthenticated
//               ? HomeScreen()
//               : WalkThroughScreen()
//           : SplashScreen(),
//       routes: {
//         Routes.home: (ctx) =>
//             auth.isAuthenticated ? HomeScreen() : AuthenticationScreen()
//       },
//     );
//   }
// }