import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                "assets/main_top.png",
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/main_bottom.png",
                width: size.width * 0.2,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "WELCOME TO SAMACHAR YOURS OWN NEWS APPLICATION",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/chat.svg",
                    height: size.height * 0.45,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color(0xFF6F35A5),
                          backgroundColor: Color(0xFF6F35A5),
                          onSurface: Color(0xFF6F35A5),
                          elevation: 10.0,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // I have to do this part later on
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color(0xFFF1E6FF),
                          backgroundColor: Color(0xFFF1E6FF),
                          onSurface: Color(0xFFF1E6FF),
                          elevation: 10.0,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // I have to do this part later on
                        },
                      ),
                    ),
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
