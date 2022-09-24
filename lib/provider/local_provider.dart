import 'package:ezwage_screens_demo/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier{
  Locale _currentLocale = new Locale("en");


  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale){
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }
}