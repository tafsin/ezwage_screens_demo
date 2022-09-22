
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           GestureDetector(
                             child: Container(
                               child: Icon(Icons.more_vert_outlined,color: Colors.blue,),
                             ),
                           ),
                            // SizedBox(
                            //   width: 4,
                            // ),
                            InkWell(
                               child: Container(child: Icon(Icons.notification_important_outlined,color: Colors.blue,),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text('Hi Fahad! \nWelcome Back'),
                            SizedBox(width: 4,),
                            CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage('assets/images/pp_img.jpeg'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: MediaQuery.of(context).size.width-50,
                height: 200,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_con_back.jpeg"),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(1.0, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),

                  ]

                ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Available Balance",style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("BDT 30,000",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Salary Cycle - Dec 1 to Dec 30",style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          child: Row(

                            children: [
                              Icon(Icons.wallet,color: Colors.white,),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Earnings \nBDT90,000',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.monetization_on,color: Colors.white,),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Withdrawls \nBDT30,000',style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  MaterialButton(onPressed: (){},
                    minWidth: 40,
                    height: 35,
                    color: Colors.white,
                    child: Text("Withdraw",style: TextStyle(color: Colors.blue),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),

                  )
                  // ElevatedButton(
                  //     style: ButtonStyle(
                  //         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  //         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //             RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(18.0),
                  //
                  //             )
                  //         ),
                  //      minimumSize: MaterialStateProperty.all<Size>(),
                  //     ),
                  //     onPressed: (){}, child: Text("Withdraw",style: TextStyle(color: Colors.blue),))
                ],
              ),


            ),
          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(

                            child: Icon(Icons.lock,color: Colors.blue,)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Setup PIN',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Please setup PIN to prevent unauthorized access',style: TextStyle(fontSize: 12),),

                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 2,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Account",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                SizedBox(
                  height: 15,
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(

                            child: Icon(Icons.lock,color: Colors.blue,)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bkash',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 4,
                          ),
                          Text('*******7890',style: TextStyle(fontSize: 12),),

                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 2,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transaction",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text('See All',style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(

                                  child: Icon(Icons.library_books_sharp,color: Colors.blue,)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sheikh Fahad',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('BDT 20,000',style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('March 22, 2022',style: TextStyle(color: Colors.grey,fontSize: 10),)

                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 2,
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
