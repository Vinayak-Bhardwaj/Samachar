import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Services/auth.dart';
import 'package:samachar/Services/database.dart';
import 'package:samachar/Shared/rounded_button.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  
  String? _currentName;
  String? _currentPhoneNumber;
  String? _currentEmailId;
  String? _currentNewsSubscription;

  AuthService _auth = AuthService();

  
  
  @override
  Widget build(BuildContext context) {
    final customUserData = Provider.of<DatabaseService>(context);
    Map Data = ModalRoute.of(context)!.settings.arguments as Map;
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Profile"),
      ),
      body: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/main_bottom.png",
                width: size.width * 0.25,
              ),
            ),

            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextFormField(
                      initialValue: Data['name'],
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF1E6FF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF1E6FF), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF6F35A5), width: 2.0),
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter a name" : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextFormField(
                      initialValue: Data['emailId'],
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF1E6FF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF1E6FF), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF6F35A5), width: 2.0),
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter a EmailId" : null,
                      onChanged: (val) => setState(() => _currentEmailId = val),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextFormField(
                      initialValue: Data['phoneNo'],
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF1E6FF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF1E6FF), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF6F35A5), width: 2.0),
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter a Phone Number" : null,
                      onChanged: (val) => setState(() => _currentPhoneNumber = val),
                    ),
                  ),

                  // Had to add the news Subscription Thing with radio buttons

                  // Had to add a image or a gif for editing the information purpose

                  SizedBox(height: 50),

                  RoundedButton(whichAuthentication: "Update", pressed: () async{
                    if(_formKey.currentState!.validate()) {
                      print("Hello Im here");
                      await DatabaseService(uid: _auth.currentUser()!.uid).updateUserData(
                        _currentName ?? Data['name'],
                        _currentEmailId ?? Data['emailId'], 
                        _currentPhoneNumber ?? Data['phoneNo'],
                        _currentNewsSubscription ?? Data['newsSubscription'],
                      );
                      Navigator.pop(context);
                    }
                  }),

                ],
              ),
            ),

           
          ],
        ),
      ),
    );
  }
}
