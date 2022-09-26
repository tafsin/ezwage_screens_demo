
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WithDraw extends StatefulWidget {
  const WithDraw({Key? key}) : super(key: key);

  @override
  State<WithDraw> createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> {
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                
              ],
            ),
            content: Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width:50,
                    child: TextFormField(
                      onSaved: (value){
                        pin1.text = value!;
                      },
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],

                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width:50,
                    child: TextFormField(
                      onSaved: (value){
                        pin2.text = value!;
                      },
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],

                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width:50,
                    child: TextFormField(
                      onSaved: (value){
                        pin3.text = value!;
                      },
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],

                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width:50,
                    child: TextFormField(
                      onSaved: (value){
                        pin4.text = value!;
                      },
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],

                    ),
                  ),
                ],
              ),
            )

          );
        });
  }
  TextEditingController inputAmountController = TextEditingController();
  double value = 0.0;
  List values = ['0','30K','40K'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                color: Color(0xffEEEEEE),
                height: 1.0,
              ),
            ),
            preferredSize: Size.fromHeight(1.0)),
        leading:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xffEC0B8D
                    ).withOpacity(0.1)
                ),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: IconButton(
                icon:  Icon(Icons.arrow_back_ios_outlined,color: Color(0xffEC0B8D)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        title: Text("Withdraw",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00A2FF)
                    ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),



          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: MediaQuery.of(context).size.width-50,
              height: 171,

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

                ],
              ),


            ),
          ),
          Center(
            child: Text(
              'Enter the amount you wish to withdraw',
              style: GoogleFonts.poppins(

                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff6A6A6A)
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 59,
                height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0,11
                        ),
                        blurRadius: 11,
                        color: Color.fromRGBO(0, 0, 0,0.059)
                      )
                    ],
                    borderRadius: BorderRadius.circular(6)
                  ),


                  child: Center(
                    child: Text("BDT",
                      style: GoogleFonts.poppins(

                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6A6A6A)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                width: 3,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(width: 2,color: Color(0xffCCCCCC))
                        )
                      ),

                      controller: inputAmountController,


                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 14.0,
                      pressedElevation: 8.0,
                    ),
                    thumbColor: Colors.red,


                  ),
                  child: Slider(

                    value: value,
                    min: 0,
                    max: 40000,
                    divisions: 2,
                    onChangeStart: (double value) {
                      print('Start value is ' + value.toString());
                    },
                    onChangeEnd: (double value) {
                      print('Finish value is ' + value.toString());
                    },
                    onChanged: (double newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveColor: Color(0xffD1EEFF),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) => Text("${values[index]}")),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
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

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.infinity, // <-- match_parent
// <-- match-parent
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff00a2ff),
                      minimumSize: Size(350,50),
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                         
                      )

                    ),
                    onPressed: (){
                      _displayTextInputDialog(context);

                    }, child: Text(AppLocalizations.of(context)!.nextBtn))),
          ),



        ],
      ),

    );
  }
}
