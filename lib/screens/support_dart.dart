

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),

          Container(
            child: Text("Support",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff00A2FF)
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset('assets/images/support_pic.png',
            height: 200,
                width: 200,),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,15,15,5),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text("Are you facing difficulties?",
                  style: GoogleFonts.poppins(

                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00A2FF)

                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,5,15,15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('In case of any quries, feel free to connect \n'
                  'with us via the following options',
                style: GoogleFonts.poppins(

                  fontSize: 13,
                  fontWeight: FontWeight.w400,

                ),
                ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,color: Color(0xffF7F8F9)
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4,4),
                    blurRadius: 10,
                      color: Color.fromRGBO(40, 86, 120, 0.08)
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    Icon(Icons.chat,color: Color(0xff00A2FF),),
                    Text("Live Chat with Customer Support")
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,color: Color(0xffF7F8F9)
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4,4),
                        blurRadius: 10,
                        color: Color.fromRGBO(40, 86, 120, 0.08)
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    Icon(Icons.mail_outline,color: Color(0xff00A2FF)),
                    Text("Live Chat with Customer Support")
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,5,15,15),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,color: Color(0xffF7F8F9)
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4,4),
                        blurRadius: 10,
                        color: Color.fromRGBO(40, 86, 120, 0.08)
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    Icon(Icons.question_mark_outlined,color: Color(0xff00A2FF)),
                    Text("Live Chat with Customer Support")
                  ],
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}