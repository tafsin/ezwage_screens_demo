
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/language_picker_widget.dart';



class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> with TickerProviderStateMixin{
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int _currentTabIndex = 0;
  bool nxt1 = false;
  bool nxt2 = false;
  bool nxt3 = false;
  int activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this,initialIndex: 0);

    tabController.animateTo(_currentTabIndex);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.blueAccent,

                ]
            )
        ),

        child: Column(

          children: [
            SizedBox(
              height:
              20,
            ),
            Container(
              child: LanguagePickerWidget(),
            ),
            SizedBox(
              height:
              10,
            ),
            Container(
              height: 100,
              child: Center(
                child: Text('ezwage',style: TextStyle(
                    color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
                ),),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)
                      )
                  ),
                  child:Column(
                    children: [
                      Container(

                        child: TabBar(
                          labelColor: Color(0xffdb1695),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color(0xffdb1695),
                          indicatorSize: TabBarIndicatorSize.label,
                          controller:  tabController,
                          isScrollable: true,

                          tabs: [
                            Tab(child: SizedBox(
                                width: 60,
                                child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!.login

                                  ),
                                )
                            ),),
                            Tab(child: SizedBox(
                                width: 70,
                                child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!.signUp

                                  ),
                                )
                            ),),

                          ],

                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller:  tabController,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView(
                                  // mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          child: Text(AppLocalizations.of(context)!.phoneNumber,style: TextStyle(
                                              fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(

                                          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                            0.1,
                                            0.9
                                          ], colors: [
                                            Colors.black.withOpacity(.2),
                                            Colors.black.withOpacity(.1)
                                          ]),
                                          borderRadius: BorderRadius.circular(10)
                                      ),


                                      child: TextFormField(
                                        controller: numberController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,


                                          hintText: AppLocalizations.of(context)!.phoneNumberHint,
                                          hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                                          enabledBorder: OutlineInputBorder(

                                            borderSide: BorderSide.none,

                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),


                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          child: Text(AppLocalizations.of(context)!.password,style: TextStyle(
                                              fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
// Box decoration takes a gradient
                                          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                            0.1,
                                            0.9
                                          ], colors: [
                                            Colors.black.withOpacity(.2),
                                            Colors.black.withOpacity(.1)
                                          ]),
                                          borderRadius: BorderRadius.circular(10)
                                      ),


                                      child: TextFormField(
                                        controller: numberController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,


                                          hintText: AppLocalizations.of(context)!.phoneNumberHint,
                                          hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                                          enabledBorder: OutlineInputBorder(

                                            borderSide: BorderSide.none,

                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),


                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [

                                        Text(AppLocalizations.of(context)!.forgotPassword,

                                          style: TextStyle(color: Colors.grey,fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width: double.infinity, // <-- match_parent
// <-- match-parent
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xffdb1695)
                                            ),
                                            onPressed: (){}, child: Text(AppLocalizations.of(context)!.login))),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(AppLocalizations.of(context)!.doNotHaveAccount,

                                          style: TextStyle(color: Colors.grey,fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            print('sign up');
                                            setState(() {
                                              _currentTabIndex = 1;
                                            });
                                          },
                                          child: Text(AppLocalizations.of(context)!.signUp,

                                            style: TextStyle(color: Colors.blue,fontSize: 12, fontWeight: FontWeight.w600

                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: 60,
                                            child: Divider(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(AppLocalizations.of(context)!.or),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Expanded(child: SizedBox(
                                          width: 60,
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 38,
                                            width: 40,


                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: IconButton(onPressed: (){}, icon:Icon(Icons.fingerprint,color: Colors.white,size: 25,))),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(AppLocalizations.of(context)!.touchLogin)
                                      ],
                                    )



                                  ],
                                ),
                              ),
                            ),
                            formBuilder()




                          ],
                        ),
                      )
                    ],
                  )
              ),
            )
          ],
        ),

      ),

    );
  }
  Widget signUp1(){
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.firstName,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.firstName,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.lastName,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.lastName,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.emailAddress,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.emailAddress,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.phoneNumber,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.phoneNumberHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: double.infinity, // <-- match_parent
// <-- match-parent
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffdb1695)
                    ),
                    onPressed: (){
                      print("pressed");
                      setState(() {
                        activeIndex++;
                        _currentTabIndex = 1;
                      });
                    }, child: Text(AppLocalizations.of(context)!.nextBtn))),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.haveAccount,

                  style: TextStyle(color: Colors.grey,fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _currentTabIndex = 0;
                    });
                  },
                  child: Text(AppLocalizations.of(context)!.login,

                    style: TextStyle(color: Colors.blue,fontSize: 12, fontWeight: FontWeight.w600

                    ),
                  ),
                )
              ],
            ),


          ],

        ),
      ),
    );
  }
  Widget signUp2(){
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.nid,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.nid,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.gender,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.gender,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),

            SizedBox(
                width: double.infinity, // <-- match_parent
// <-- match-parent
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffdb1695)
                    ),
                    onPressed: (){
                      setState(() {
                        activeIndex++;
                        _currentTabIndex = 1;
                      });
                    }, child: Text(AppLocalizations.of(context)!.nextBtn))),



          ],

        ),
      ),
    );
  }
  Widget signUp3(){
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.companyName,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.companyNameHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.employeeType,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.employeeTypeHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.salary,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.salaryHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),

            SizedBox(
                width: double.infinity, // <-- match_parent
// <-- match-parent
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffdb1695)
                    ),
                    onPressed: (){
                      setState(() {
                        activeIndex++;
                        _currentTabIndex = 1;
                      });
                    }, child: Text(AppLocalizations.of(context)!.nextBtn))),



          ],

        ),
      ),
    );
  }
  Widget signUp4(){
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(top:16,left: 16,right: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.newPassword,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText:AppLocalizations.of(context)!.newPasswordHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  child: Text(AppLocalizations.of(context)!.confirmPassword,style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1)
                  ]),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: AppLocalizations.of(context)!.confirmPasswordHint,
                  hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),


            SizedBox(
                width: double.infinity, // <-- match_parent
// <-- match-parent
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffdb1695)
                    ),
                    onPressed: (){

                    }, child: Text(AppLocalizations.of(context)!.signUp))),



          ],

        ),
      ),
    );
  }
  Widget formBuilder() {

    switch (activeIndex) {
      case 0:
        return signUp1();
      case 1:
        return signUp2();
      case 2:
        return signUp3();
      case 3:
        return signUp4();
      default:
        return signUp1();
    }
  }
}

