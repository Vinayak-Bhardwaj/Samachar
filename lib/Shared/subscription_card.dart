import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {

  String image;
  String categoryName;

  SubscriptionCard({required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 200,
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
    );
  }
}