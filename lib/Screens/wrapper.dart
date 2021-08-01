//This is the Place where it is decided to send the user either to authenticate screens or to home


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:samachar/Screens/Authenticate/authenticate.dart';
import 'package:samachar/Screens/Authenticate/Register/register.dart';
import 'package:samachar/Screens/Authenticate/SignIn/sign_in.dart';
import 'package:samachar/Screens/Authenticate/welcome_screen.dart';
import 'package:samachar/Screens/Home/home.dart';
import 'package:samachar/Services/database.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final customizedUser =  Provider.of<CustomizedUser?>(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    //Return either home or authenticate widget
    if(customizedUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}