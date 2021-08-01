//This is the place which decides whether to send to register or to sign in screen


import 'package:flutter/material.dart';
import 'package:samachar/Screens/Authenticate/Register/register.dart';
import 'package:samachar/Screens/Authenticate/SignIn/sign_in.dart';

class Authenticate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}