import 'package:flutter/widgets.dart';

class Leite with ChangeNotifier{

  bool _leiteIsVisible = true;

  bool get leiteIsVisible => _leiteIsVisible;

    void toggleLeite(){
    _leiteIsVisible = !_leiteIsVisible;
    notifyListeners();
  }


  
}