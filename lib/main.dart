import 'package:ezwage_screens_demo/l10n/l10n.dart';
import 'package:ezwage_screens_demo/provider/local_provider.dart';
import 'package:ezwage_screens_demo/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> LocaleProvider(),
      builder: (context,child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],




          home: Login_Page(),
        );
      }
    );
  }
}




