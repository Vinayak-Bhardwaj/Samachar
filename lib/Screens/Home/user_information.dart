import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/database.dart';
import 'package:samachar/Shared/rounded_button.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    //final customUserData = Provider.of<CustomUserData>(context);

    AuthService _auth = AuthService();
    final customUserData = Provider.of<DatabaseService>(context);
    //Map mappedDoc = customUserData.getData(_auth.currentUser()!.uid);

    return FutureBuilder(
        future: customUserData.getData(_auth.currentUser()!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Text(
                    'NAME : ${customUserData.mappedDoc['name']}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                SizedBox(height: 20.0),
                Text(
                    'EMAIL : ${customUserData.mappedDoc['emailId']}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                SizedBox(height: 20.0),
                Text(
                    'NEWS SUBSCRIPTION : ${customUserData.mappedDoc['newsSubscription']}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                SizedBox(height: 20.0),
                Text('PHONE NUMBER : ${customUserData.mappedDoc['phoneNo']}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                SizedBox(height: 40.0),
                RoundedButton(
                    whichAuthentication: "Edit Profile",
                    pressed: () {
                      Navigator.pushNamed(context, '/SettingsForm', arguments: {
                        'name': customUserData.mappedDoc['name'],
                        'phoneNo': customUserData.mappedDoc['phoneNo'],
                        'emailId': customUserData.mappedDoc['emailId'],
                        'newsSubscription': customUserData.mappedDoc['newsSubscription'],
                      });
                    }),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
