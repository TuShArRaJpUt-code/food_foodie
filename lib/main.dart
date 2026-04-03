import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_food_ordering/provider/DarkmodeThemeprovider.dart';
import 'package:mini_food_ordering/provider/cart_provider.dart';
import 'package:mini_food_ordering/screens/User_login_screen.dart';
import 'package:mini_food_ordering/screens/User_signUp_screen.dart';
import 'package:mini_food_ordering/screens/home_screen.dart';
import 'package:mini_food_ordering/services/Splash_logic.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>CartProvider()),
    ChangeNotifierProvider(create:(_)=>Darkmodethemeprovider())
   ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final themeProvider = Provider.of<Darkmodethemeprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.getThemeValue()
          ? ThemeMode.dark
          : ThemeMode.light,
      home: SplashLogic(),
    );

  }
}