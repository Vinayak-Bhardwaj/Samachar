import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String whichAuthentication;
  void Function()? pressed;

  RoundedButton({required this.whichAuthentication, required this.pressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            primary: Color(0xFF6F35A5),
            backgroundColor: Color(0xFF6F35A5),
            onSurface: Color(0xFF6F35A5),
          ),
          onPressed: pressed,
          child: Text(
            whichAuthentication,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
