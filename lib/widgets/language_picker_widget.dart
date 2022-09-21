import 'package:ezwage_screens_demo/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../provider/local_provider.dart';



class LanguagePickerWidget extends StatefulWidget {
  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  List labels =[];

   List<Widget> fruits = <Widget>[
    Text('English'),
    Text('Bangla'),

  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');
   

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
              (locale) {
                print('print $locale');
            final flag = L10n.getLanguage(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                print("on $locale");
                final provider =
                Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}