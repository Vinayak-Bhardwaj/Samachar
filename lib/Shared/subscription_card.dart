import 'package:flutter/material.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/database.dart';

class SubscriptionCard extends StatefulWidget {

  String image;
  String categoryName;
  String newsSubscription;

  SubscriptionCard({required this.categoryName, required this.image, required this.newsSubscription});

  @override
  _SubscriptionCardState createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  AuthService _auth = AuthService();

  Color color = Colors.white;
  Color colorChange() {
    color = (color == Colors.white) ? Colors.yellow : Colors.white;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.182,
      width: size.width*0.486,
      child: GestureDetector(
        onTap: () async {
          await DatabaseService(uid: _auth.currentUser()!.uid).updateNewsSubscription(widget.newsSubscription);
          setState(() {
            color = colorChange();
          });
        },
        child: Container(
          color: color,
          child: Card(
            elevation: 5.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.height*0.0121),
            ),
            
              child: Stack(
                children: <Widget>[
                  Ink.image(image: AssetImage('assets/${widget.image}'), fit: BoxFit.cover),
            
                  Text("${widget.categoryName}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.0, backgroundColor: Colors.white)),
            
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}