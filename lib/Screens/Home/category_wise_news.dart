import 'package:flutter/material.dart';
import 'package:samachar/Screens/Home/single_category_news.dart';
import 'package:samachar/Services/news_service.dart';

class CategoryWiseNews extends StatefulWidget {
  
  @override
  _CategoryWiseNewsState createState() => _CategoryWiseNewsState();
}

class _CategoryWiseNewsState extends State<CategoryWiseNews> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;

    String apiUrl = 'https://newsapi.org/v2/top-headlines?country=in&category=${data['category_endpoint']}&apiKey=acc6c7e1be91477bba7be4d79748a695';

    //NewsService service = NewsService(urlNews: apiUrl);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('${data['title']}', style: TextStyle(fontFamily: 'Acme', fontSize: 21)),
      ),
      body: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
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
              SingleCategory(urlNews: apiUrl), 
            //),
          ],
        ),
      ),
    );
  }
}