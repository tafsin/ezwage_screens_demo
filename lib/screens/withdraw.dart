
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WithDraw extends StatefulWidget {
  const WithDraw({Key? key}) : super(key: key);

  @override
  State<WithDraw> createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),

          Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Align(
                   alignment: Alignment.topLeft,
                   child: IconButton(onPressed:(){
                     Navigator.pop(context);
                   }, icon: Icon(Icons.arrow_back_ios_outlined,color: Color(0xffEC0B8D
                   ),)),
                 ),
                  Text("Withdraw",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00A2FF)
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),

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

          
        ],
      ),

    );
  }
}
