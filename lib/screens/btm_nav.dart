


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ezwage_screens_demo/screens/analytics_page.dart';
import 'package:ezwage_screens_demo/screens/history_page.dart';
import 'package:ezwage_screens_demo/screens/home_page.dart';
import 'package:ezwage_screens_demo/screens/learn_page.dart';
import 'package:ezwage_screens_demo/screens/support_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottom_NavigationBar extends StatefulWidget {
  const Bottom_NavigationBar({Key? key}) : super(key: key);

  @override
  State<Bottom_NavigationBar> createState() => _Bottom_NavigationBarState();
}

class _Bottom_NavigationBarState extends State<Bottom_NavigationBar> {
  int index =2;
  final screens=[
    Learn(),
    Analytics(),
    Home_Page(),
    History(),
    Support(),

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(

       // extendBody: true,
        body: screens[index],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
                 color: Color.fromRGBO(0, 0, 0, 0.1),
                 offset: Offset(0,-1),
                 blurRadius: 6,
               //  spreadRadius: 0.3
             )
            ],
          ),

          child: CurvedNavigationBar(

            backgroundColor: Colors.transparent ,
            height: 70,
            index: index,
            items: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow, size: 30,color: index == 0 ? Colors.pink : Colors.grey,),
                  Text("Learn",style: TextStyle(color: index == 0 ? Colors.pink : Colors.grey,),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.analytics, size: 30,color: index == 1 ? Colors.pink : Colors.grey,),
                  Text("Analytics",style: TextStyle(color: index == 1 ? Colors.pink : Colors.grey,),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, size: 30,color: index == 2 ? Colors.pink : Colors.grey,),
                  Text("Home",style: TextStyle(color: index == 2 ? Colors.pink : Colors.grey,),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 30,color: index == 3 ? Colors.pink : Colors.grey,),
                  Text("History",style: TextStyle(color: index == 3 ? Colors.pink : Colors.grey,),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.support_agent, size: 30,color: index == 4 ? Colors.pink : Colors.grey,),
                  Text("Support",style: TextStyle(color: index == 4 ? Colors.pink : Colors.grey,),)
                ],
              ),
            ],
            onTap: (index){
              setState((){
               this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
