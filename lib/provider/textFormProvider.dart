import 'package:flutter/material.dart';

class TextFormProvider extends ChangeNotifier{
  late String val;
  String get name => val;
  setname(String name) {
    val = name;
    notifyListeners();
  }
}