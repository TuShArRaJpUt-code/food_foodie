import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_food_ordering/screens/User_login_screen.dart';

class Logout {

  static Future<void> logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Navigate to Login Screen and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UserLoginScreen()),
            (route) => false,
      );

    } catch (e) {
      print("Logout Error: $e");
    }
  }
}