import 'package:flutter/material.dart';
import 'package:projeto_aplicado/temas/modo_claro.dart';
import 'package:projeto_aplicado/temas/modo_escuro.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ModoClaro;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == ModoEscuro;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == ModoClaro){
      themeData = ModoEscuro;
    }else {
      themeData = ModoClaro;
    }
  }
}