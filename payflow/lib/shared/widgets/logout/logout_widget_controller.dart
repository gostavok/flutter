import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController {
  void logout(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    await _googleSignIn.disconnect();

    final instance = await SharedPreferences.getInstance();
    instance.remove("user");
    Navigator.pushReplacementNamed(context, "/splash");
  }
}
