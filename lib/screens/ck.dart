//
// import 'package:flutter/material.dart';
//
// class ck extends StatelessWidget {
//   const ck({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       child: Stack(
//         children: <Widget>[
//           Navigator(
//             key: _navigatorKey,
//             onGenerateRoute: (RouteSettings settings) {
//               return MaterialPageRoute(
//                 builder: (BuildContext context) => pages[cur_ind],
//               );
//             },
//           ),
//         ],
//         bottomNavigationBar: BottomNavigationBar(
//
//           onTap: (int index){
//
//             setState(() {
//
//               cur_ind=index;
//
//             });
//
//           },
//           currentIndex: cur_ind,
//           fixedColor: Colors.green, //let's say
//
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text('Home'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.mail),
//               title: Text('Messages'),
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.person), title: Text('Profile'))
//           ],
//         ),
//       ),
//     );
//   }
// }
