import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samachar/Models/customized_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:samachar/Services/database.dart';

class AuthService {
  
  //Creating an instance of firebase auth to access its features
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  
  //Function to extract user object with same uid from a firebase user
  CustomizedUser? _userFromFirebaseUser(User? user) {
    return (user != null) ? CustomizedUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<CustomizedUser?> get streamUser {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }


  //Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      CustomizedUser? customizedUser = _userFromFirebaseUser(user);
      return customizedUser;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name, String phoneNo) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      CustomizedUser? customizedUser = _userFromFirebaseUser(user);

      await DatabaseService(uid: customizedUser!.uid).updateUserData(name, email, phoneNo, 'none');

      return customizedUser;
    } catch(e) {
      print(e.toString);
      return null;
    }
  }

  //SignOut 
  Future signOut() async{
    try{
      void result = await _auth.signOut();
      return result;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //Google Sign In
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

  //Google SignOut
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

}