import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mqtt_project/screens/home.dart';

class FacebookAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future loginWithFacebook(BuildContext context) async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin
        .logInWithReadPermissions(['email', "public_profile"]);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // TODO: Handle this case.
        final token = result.accessToken.token;
        print("Access token = $token");
        await _auth.signInWithCredential(
            FacebookAuthProvider.getCredential(accessToken: token));
        checkAuth(context); // after success, navigate to home.
        break;
      case FacebookLoginStatus.cancelledByUser:
        // TODO: Handle this case.
        print("Cancel");
        break;
      case FacebookLoginStatus.error:
        // TODO: Handle this case.
        break;
    }
  }

  Future checkAuth(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      print("Already singed-in with");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home.setUser(user: user)));
    }
  }
}
