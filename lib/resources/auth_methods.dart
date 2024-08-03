import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_conferencing_app/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<User?> get Authchanged => _auth.authStateChanges();

  Future<bool> signinwithgoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if(user != null){
        if(userCredential.additionalUserInfo!.isNewUser){
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName, 'uid': user.uid, 'profilephoto': user.photoURL,
          });
        }
        res =true;
      } 
    }on FirebaseAuthException  catch (e) {
      showsnackbar(context, e.message!);
      res =false;


    }
    return res;
  }
}
