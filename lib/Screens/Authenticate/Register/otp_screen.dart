import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:samachar/Screens/Home/home.dart';

class OTPScreen extends StatefulWidget {
  String phoneNumber;
  OTPScreen({required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _otp = TextEditingController();

  bool isLoggedIn = false;
  bool otpSent = false;
  late String uid;
  late String _verificationId;
  late String countryCode = '';

  void _verifyOTP() async {
    // we know that _verificationId is not empty
    final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: _otp.text);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (FirebaseAuth.instance.currentUser != null) {
        setState(() {
          isLoggedIn = true;
          uid = FirebaseAuth.instance.currentUser!.uid;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumber.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    setState(() {
      otpSent = true;
    });
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  void codeSent(String verificationId, int? a) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  void verificationFailed(FirebaseAuthException exception) {
    print(exception.message);
    setState(() {
      isLoggedIn = false;
      otpSent = false;
    });
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoggedIn = true;
        uid = FirebaseAuth.instance.currentUser!.uid;
      });
    } else {
      print("Failed to Sign In");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneNumber = TextEditingController(text: widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    //print(TextEditingController(text: '+' + countryCode + _phoneNumber.text).text);
    return new Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
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
              left: 0,
              child: Image.asset(
                "assets/main_bottom.png",
                width: size.width * 0.25,
              ),
            ),
            SingleChildScrollView(
              child: isLoggedIn
                  ? Home()
                  : otpSent
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.05),
                            Image.asset(
                              "assets/download.jpeg",
                              height: size.height * 0.30,
                            ),
                            TextField(
                              controller: _otp,
                              decoration: InputDecoration(
                                hintText: "Enter your OTP",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _verifyOTP,
                              child: Text("Sign In"),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: size.height * 0.01),
                            Image.asset(
                              "assets/download.jpeg",
                              height: size.height * 0.3,
                            ),
                            //SizedBox(height: size.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 40),
                                      primary: Color(0xFF6F35A5),
                                      onSurface: Color(0xFF6F35A5),
                                    ),
                                    onPressed: () {
                                      showCountryPicker(
                                        context: context,
                                        //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                        exclude: <String>['KN', 'MF'],
                                        //Optional. Shows phone code before the country name.
                                        showPhoneCode: true,
                                        onSelect: (Country country) {
                                          print(
                                              'Select country: ${country.displayName.substring(15, country.displayName.length)}');
                                          print(
                                              'Country code for the country : ${country.phoneCode}');
                                              print(
                                              'Country code for the country : ${country.name}');
                                          setState(() {
                                            countryCode = country.phoneCode;
                                            _phoneNumber = TextEditingController(
                                                text: '+' +
                                                    countryCode +
                                                    _phoneNumber.text);
                                            //country.phoneCode;
                                          });
                                        },
                                        // Optional. Sets the theme for the country list picker.
                                        countryListTheme: CountryListThemeData(
                                          // Optional. Sets the border radius for the bottomsheet.
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                          ),
                                          // Optional. Styles the search field.
                                          inputDecoration: InputDecoration(
                                            labelText: 'Search',
                                            hintText: 'Start typing to search',
                                            prefixIcon: const Icon(Icons.search),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xFF8C98A8)
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.flag,size: 28),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneNumber,
                                      decoration: InputDecoration(
                                        hintText: "Enter your phone number",
                                        border: OutlineInputBorder(),
                                        //prefixText: '+' + countryCode,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _sendOTP,
                              child: Text("Send OTP"),
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
