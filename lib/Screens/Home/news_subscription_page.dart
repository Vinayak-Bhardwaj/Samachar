import 'package:flutter/material.dart';
import 'package:samachar/Shared/subscription_card.dart';

class NewsSubscriptionPage extends StatefulWidget {
  @override
  _NewsSubscriptionPageState createState() => _NewsSubscriptionPageState();
}

class _NewsSubscriptionPageState extends State<NewsSubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("News Subscription Page"),
        backgroundColor: Colors.indigo
      ),
      body: Container(
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
            SingleChildScrollView(
               child: Column(
                 children: <Widget>[
                   Row(
                     children: [
                       SubscriptionCard(image: 'entertainment.jpeg', categoryName: 'Entertainment'),
                       SubscriptionCard(image: 'sports4.jpeg', categoryName: 'Sports'),
                     ],
                   ),
                   SizedBox(height: 30.0),
                   Row(
                     children: [
                       SubscriptionCard(image: 'health2.png', categoryName: 'Health'),
                       SubscriptionCard(image: 'science4.png', categoryName: 'Science'),
                     ],
                   ),
                   SizedBox(height: 30.0),
                   Row(
                     children: [
                       SubscriptionCard(image: 'techq.png', categoryName: 'Technology'),
                       SubscriptionCard(image: 'business4.jpeg', categoryName: 'Business'),
                     ],
                   ),
                 ],
               ),
            ),
          ],
        ),
      ),
    );
  }
}