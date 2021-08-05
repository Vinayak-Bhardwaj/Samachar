import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Screens/Home/mews.dart';
import 'package:samachar/Screens/Home/multiple_category_news.dart';
import 'package:samachar/Screens/Home/newspaper.dart';
import 'package:samachar/Screens/Home/profile.dart';
import 'package:samachar/Screens/Home/single_category_news.dart';
import 'package:samachar/Services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  //AuthService _auth = AuthService();
  int page = 0;

  List<String> appBar = [
    "This is Single Category Screen",
    "This is Multiple Category Screen",
    "This is the News paper screen",
    "This is the mews screen",
    "This is the profile Screen",
  ];

  String generalNews =  'https://newsapi.org/v2/top-headlines?country=in&apiKey=acc6c7e1be91477bba7be4d79748a695';

  // @override
  // void initState(){
  //   super.initState();
  //   Future.delayed(Duration(seconds: 1), (){
  //     setState((){});
  //   });
  // }
  
  
  @override
  Widget build(BuildContext context) {
    
    
    print("BHai ab to me home ke build me hu&&&&&&&&&&&&&&&&&&");
    final _auth = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.of(context).size;
    //_auth.signOut();
    // print(size.height);
    // print(size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBar[page]),
        backgroundColor: Colors.indigo[400],
        elevation: 50.0,
        shadowColor: Colors.black,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              _auth.signOut();
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/main_bottom.png",
                width: size.width * 0.25,
              ),
            ),
            //SingleChildScrollView(
               (page == 0) ? SingleCategory(urlNews: generalNews) : (page == 1) ? MultipleCategory() : (page == 2) ? NewsPaper() : (page == 3) ? Mews() : Profile(),
            //),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60,
          buttonBackgroundColor: Colors.red[100],
          backgroundColor: Colors.white10,
          color: Colors.grey,
          items: <Widget>[
            ImageIcon(
              AssetImage("assets/news2.png"),
              size: 32,
            ),
            ImageIcon(
              AssetImage("assets/news3.png"),
              size: 32,
            ),
            ImageIcon(
              AssetImage("assets/newspaper.png"),
              size: 32,
            ),
            ImageIcon(
              AssetImage("assets/laughingFinal.png"),
              size: 32,
            ),
            ImageIcon(
              AssetImage("assets/profile.png"),
              size: 32,
            ),
          ],
          animationDuration: Duration(milliseconds: 500),
          animationCurve: Curves.linearToEaseOut,
          onTap: (index) {
            setState(() {
              page = index;
            });
          }),
    );
  }
}
