// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';

// import '../utils/enums.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';


// // Main Class

// class AuthProvider extends ChangeNotifier {
  
//   //Variables
//   User _user;

  
//   //Getter Function
//   User get user => _user;
//   bool get isAuthenticated => _state == AuthState.authenticated;
//   bool get isInitialised => _state != AuthState.uninitialised;


//   //Setter Function
//   void _onAuthStateChanges(User user) async {
//     if (user != null) {
//       _state = AuthState.authenticated;
//     } else {
//       _state = AuthState.unauthenticated;
//     }
//     _user = user;
//     notifyListeners();
//   }


//   //instances
//   AuthState _state = AuthState.uninitialised;
//   FirebaseAuth _auth = FirebaseAuth.instance;

  

//   AuthProvider() {
//     _auth.authStateChanges().listen(_onAuthStateChanges);
//   }

  

//   Future<void> _saveToken(String uid) async {
//     final deviceToken = await FirebaseMessaging().getToken();
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('tokens')
//         .doc(deviceToken)
//         .set({
//       'token': deviceToken,
//       'platform': Platform.operatingSystem,
//     });
//   }

//   Future<void> _deleteToken() async {
//     final deviceToken = await FirebaseMessaging().getToken();
//     try {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .collection('tokens')
//           .doc(deviceToken)
//           .delete();
//     } catch(e, f){
//       print(e);
//       print(f);
//     }
//   }

//   Future<void> signIn(String email, String password) async {
//     final cred = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     await _saveToken(cred.user.uid);
//   }

//   Future<void> signInWithGoogle() async {
//     GoogleSignIn _googleSignIn = GoogleSignIn();
//     final user = await _googleSignIn.signIn();
//     final auth = await user.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: auth.accessToken,
//       idToken: auth.idToken,
//     );
//     final cred = await _auth.signInWithCredential(credential);
//     await _saveToken(cred.user.uid);
//   }

//   Future<void> signUp(String email, String password, String username) async {
//     final cred = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     await Future.wait([
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(cred.user.uid)
//           .update({'username': username}),
//       _saveToken(cred.user.uid)
//     ]);
//   }

//   Future<void> forgotPassword(String email) {
//     return _auth.sendPasswordResetEmail(email: email);
//   }

//   Future<void> logout() async {
//     await _deleteToken();
//     return _auth.signOut();
//   }
// }