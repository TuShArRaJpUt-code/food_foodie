import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_food_ordering/screens/home_screen.dart';
import 'package:mini_food_ordering/screens/User_login_screen.dart';

class SplashLogic extends StatefulWidget {
  @override
  _SplashLogicState createState() => _SplashLogicState();
}

class _SplashLogicState extends State<SplashLogic> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2)); // splash delay

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // User not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserLoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/logo.png", width: 150),
      ),
    );
  }
}