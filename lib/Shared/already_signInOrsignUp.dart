import 'package:flutter/material.dart';

class AlreadySignInOrSignUp extends StatelessWidget {
  
  String text1;
  String text2;
  void Function()? tap;

  AlreadySignInOrSignUp({required this.text1,required this.text2, required this.tap});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text1,
          style: TextStyle(color: Color(0xFF6F35A5)),
        ),
        GestureDetector(
          onTap: tap,
          child: Text(
            text2,
            style: TextStyle(
              color: Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
