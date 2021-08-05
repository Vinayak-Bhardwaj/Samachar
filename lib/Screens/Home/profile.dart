import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:samachar/Screens/Home/user_information.dart';
import 'package:samachar/Services/database.dart';
import 'package:samachar/Shared/rounded_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //final customizedUser = Provider.of<CustomizedUser?>(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100.0),
          CircleAvatar(
            backgroundImage: NetworkImage(
                // Had to add a profile image good cartoon one
                'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/da755de0cef0e312848311445f4e6513.jpg'),
            radius: 82,
          ),
          Divider(
            height: 60.0,
            indent: 50.0,
            endIndent: 50.0,
            color: Colors.grey,
            thickness: 1.0,
          ),
          UserInformation(),
        ],
      
    );






    // return StreamBuilder<CustomUserData>(
    //   stream: DatabaseService(uid: _auth.currentUser?.uid).customUserData,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       CustomUserData? customUserData = snapshot.data;
    //       return Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           SizedBox(height: 100.0),
    //           CircleAvatar(
    //             backgroundImage: NetworkImage(
    //                 'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/da755de0cef0e312848311445f4e6513.jpg'),
    //             radius: 82,
    //           ),
    //           Divider(
    //             height: 60.0,
    //             indent: 50.0,
    //             endIndent: 50.0,
    //             color: Colors.grey,
    //             thickness: 1.0,
    //           ),
    //           Text('NAME : ${customUserData!.name}',
    //               style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 0.5)),
    //           SizedBox(height: 20.0),
    //           Text('EMAIL : ${customUserData.emailId}',
    //               style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 0.5)),
    //           SizedBox(height: 20.0),
    //           Text('NEWS SUBSCRIPTION : ${customUserData.newsSubscription}',
    //               style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 0.5)),
    //           SizedBox(height: 20.0),
    //           Text('PHONE NUMBER : ${customUserData.phoneNumber}',
    //               style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 0.5)),
    //           SizedBox(height: 40.0),
    //           RoundedButton(
    //             whichAuthentication: "Edit Profile",
    //             pressed: () {
    //               Navigator.pushNamed(context, '/SettingsForm');
    //             }
    //           ),
    //         ],
    //       );
    //     } else {
    //       return CircularProgressIndicator();
    //     }
    //   },
    // );

  }
}


// Just uncomment this and put on top and then delete user information screen and make settings form again with stream builder use