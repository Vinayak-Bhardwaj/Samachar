import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Shared/rounded_button.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    final customUserData = Provider.of<CustomUserData>(context);

    return Column(
      children: <Widget>[
        Text('NAME : ${customUserData.name}',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5)),
        SizedBox(height: 20.0),
        Text('EMAIL : ${customUserData.emailId}',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5)),
        SizedBox(height: 20.0),
        Text('NEWS SUBSCRIPTION : ${customUserData.newsSubscription}',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5)),
        SizedBox(height: 20.0),
        Text('PHONE NUMBER : ${customUserData.phoneNumber}',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5)),
        SizedBox(height: 40.0),
        RoundedButton(
            whichAuthentication: "Edit Profile",
            pressed: () {
              Navigator.pushNamed(context, '/SettingsForm');
            }),
      ],
    );
  }
}
