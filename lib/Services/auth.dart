import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:samachar/Services/database.dart';

class AuthService extends ChangeNotifier{
  
  //INSTANCES
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool loggedIn = false;

  AuthService() {
    loggedIn = _auth.currentUser != null;
  }

  
  // // auth change user stream
  // Stream<CustomizedUser?> get streamUser {
  //   return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  // }

  
  // ALL FUNCTIONS
  
  //1.Function to extract user object with same uid from a firebase user
  CustomizedUser? _userFromFirebaseUser(User? user) {
    return (user != null) ? CustomizedUser(uid: user.uid) : null;
  }

  
  //2.Function to retrieve current user
  User? currentUser() {
    return _auth.currentUser;
  }


  //3.Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      CustomizedUser? customizedUser = _userFromFirebaseUser(user);
      loggedIn = true;
      notifyListeners();
      return customizedUser;
    } catch(e) {
      print(e.toString());
      notifyListeners();
      return null;
    }
  }

  //4.Register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name, String phoneNo) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("******************Hi I am here");
      User? user = result.user;
      CustomizedUser? customizedUser = _userFromFirebaseUser(user);
      await DatabaseService(uid: customizedUser!.uid).updateUserData(name, email, phoneNo, 'none');
      loggedIn = true;
      notifyListeners();
      //return customizedUser;
    } catch(e) {
      print(e.toString);
      notifyListeners();
      //return null;
    }
  }

  //5.SignOut 
  Future signOut() async{
    try{
      void result = await _auth.signOut();
      loggedIn = false;
      notifyListeners();
      return result;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //6.Google Sign In
  Future signInWithGoogle() async {
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;
      CustomizedUser? customizedUser = _userFromFirebaseUser(user);
      return customizedUser;
    } on FirebaseAuthException catch(e) {
      print(e.toString());
      return null;
    }
  }

  //7.Google SignOut
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

}