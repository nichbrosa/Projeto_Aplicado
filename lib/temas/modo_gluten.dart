import 'package:flutter/material.dart';

class Gluten with ChangeNotifier {
  bool _glutenIsVisible = true;

  bool get glutenIsVisible => _glutenIsVisible;

  void toggleGluten() {
    _glutenIsVisible = !_glutenIsVisible;
    notifyListeners();
  }
}
