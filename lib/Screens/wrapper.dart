import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Screens/Authenticate/SignIn/sign_in.dart';
import 'package:samachar/Screens/Home/home.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/notification.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return !auth.loggedIn ? SignIn() : NotificationNews(title: "Hello");
  }
}
