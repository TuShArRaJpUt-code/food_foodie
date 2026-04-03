import 'package:flutter/cupertino.dart';

class Darkmodethemeprovider  extends ChangeNotifier{
  bool _isDark = false;

  bool getThemeValue() => _isDark;

  void updateTheme({required bool value}){
    _isDark= value;
    notifyListeners();

  }
}