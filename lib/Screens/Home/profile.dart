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
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height*0.0609),
          Image.asset("assets/profile2edited.jpg", height: size.height*0.2804),
         // SizedBox(height: 10.0),
          // CircleAvatar(
          //   backgroundImage: NetworkImage(
          //       // Had to add a profile image good cartoon one
          //       'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/da755de0cef0e312848311445f4e6513.jpg'),
          //   radius: 82,
          // ),
          Divider(
            height: size.height*0.07317,
            indent: size.width*0.1216,
            endIndent: size.width*0.1216,
            color: Colors.grey,
            thickness: 1.0,
          ),
          UserInformation(),
        ],
      ),
    );
  }
}


// Just uncomment this and put on top and then delete user information screen and make settings form again with stream builder use