import 'package:flutter/material.dart';

class L10n{
  static final all =[
    const Locale('en'),
    const Locale('bn'),
  ];
  static String getLanguage(String code){
    switch(code){
      case 'en':
        return "English";
      case 'bn':
        return "Bangla";
      default:
        return "English";

    }

  }
}