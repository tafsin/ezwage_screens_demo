
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/local_provider.dart';

class Language_Toggle extends StatefulWidget {
  const Language_Toggle({Key? key}) : super(key: key);

  @override
  State<Language_Toggle> createState() => _Language_ToggleState();
}
const double width = 110.0;
const double height = 30.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedTextColor = Color(0xff54BBFA);
const Color normalColor = Colors.white;

class _Language_ToggleState extends State<Language_Toggle> {
 late  double xAlign;
 late Color loginColor;
 late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedTextColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
     return Align(
       alignment: Alignment.centerRight,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           width: width,
           height: height,
           decoration: BoxDecoration(
             color: Color(0xff54BBFA),
             borderRadius: BorderRadius.all(
               Radius.circular(50.0),
             ),
           ),
           child: Stack(
             children: [
               AnimatedAlign(
                 alignment: Alignment(xAlign, 0),
                 duration: Duration(milliseconds: 300),
                 child: Container(
                   width: width * 0.5,
                   height: height,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.all(
                       Radius.circular(50.0),
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   setState(() {
                     xAlign = loginAlign;
                     loginColor = selectedTextColor;

                     signInColor = normalColor;
                     context.read<LocaleProvider>().changeLocale("en");
                   });
                 },
                 child: Align(
                   alignment: Alignment(-1, 0),
                   child: Container(
                     width: width * 0.5,
                     color: Colors.transparent,
                     alignment: Alignment.center,
                     child: Text(
                       'Eng',
                       style: TextStyle(
                         color: loginColor,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   setState(() {
                     xAlign = signInAlign;
                     signInColor = selectedTextColor;

                     loginColor = normalColor;
                     context.read<LocaleProvider>().changeLocale("bn");
                   });
                 },
                 child: Align(
                   alignment: Alignment(1, 0),
                   child: Container(
                     width: width * 0.5,
                     color: Colors.transparent,
                     alignment: Alignment.center,
                     child: Text(
                       'বাংলা',
                       style: TextStyle(
                         color: signInColor,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );

  }
}
