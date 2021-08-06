import 'package:flutter/material.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/database.dart';

class SubscriptionCard extends StatelessWidget {

  AuthService _auth = AuthService();
  

  String image;
  String categoryName;
  String newsSubscription;

  SubscriptionCard({required this.categoryName, required this.image, required this.newsSubscription});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 200,
      child: GestureDetector(
        onTap: () async {
          await DatabaseService(uid: _auth.currentUser()!.uid).updateNewsSubscription(newsSubscription);
        },
        child: Card(
          elevation: 5.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          
            child: Stack(
              children: <Widget>[
                Ink.image(image: AssetImage('assets/$image'), fit: BoxFit.cover),
          
                Text("$categoryName", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.0, backgroundColor: Colors.white)),
          
              ],
            ),
          
        ),
      ),
    );
  }
}