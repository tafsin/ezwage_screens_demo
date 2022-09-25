
import 'dart:convert';
import 'dart:ffi';

import 'package:ezwage_screens_demo/provider/local_provider.dart';
import 'package:ezwage_screens_demo/provider/textFormProvider.dart';
import 'package:ezwage_screens_demo/screens/btm_nav.dart';
import 'package:ezwage_screens_demo/screens/home_page.dart';
import 'package:ezwage_screens_demo/widgets/errorAlert.dart';
import 'package:ezwage_screens_demo/widgets/language_toggle.dart';
import 'package:ezwage_screens_demo/widgets/textFormField.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../json_model/employee_verfi_model.dart';
import '../widgets/language_picker_widget.dart';
import 'package:http/http.dart' as http;




class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> with TickerProviderStateMixin{
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController employeeTypeController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberSignUpController = TextEditingController();
  TextEditingController nidController = TextEditingController();


  int _currentTabIndex = 0;
  bool nxt1 = false;
  bool nxt2 = false;
  bool nxt3 = false;
  int activeIndex = 0;
  bool hidePassLogin = true;
  bool hidePassNew = true;
  bool hidePassConf = true;
  final _loginFormKey = GlobalKey<FormState>();
  final _signUp1FormKey = GlobalKey<FormState>();
  final _signUp2FormKey = GlobalKey<FormState>();
  final _signUp3FormKey = GlobalKey<FormState>();
  final _signUp4FormKey = GlobalKey<FormState>();
  String? genderValue;
  String gender = '';
  List<dynamic> genderList =['Male','Female'];
Future<void>verifyPhone()async{
  try{
    http.Response response= await http.get(Uri.parse('http://10.0.2.2:8000/api/employee/getEmployee/${numberSignUpController.text}'));
    print('info');
    print(response.statusCode);
   if(response.statusCode == 201){
     var jsdata = jsonDecode(response.body);
     var  data = EmployeeVerificationModel.fromJson(jsdata).data![0];
     print(data.firstName);
     //final TextFormProvider txtFormProvider = Provider.of<TextFormProvider>(context,listen: false);
    // txtFormProvider.setname(data.firstName!);

       firstNameController.text = data.firstName!;
       lastNameController.text = data.lastName!;
       nidController.text = data.nid!;
       salaryController.text = data.salary!;
       emailAddressController.text = data.email!;
       //genderController.text = data.g
      // employeeTypeController.text = data.employeeId!;




   }



    // print(data['roles'][0]);
    // if(data['roles'][0] == 'Admin'){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Dashboard()));
    // }
  }
  catch(e){
    print(e);
  }
}

Future<void>signUp()async{
  print(confirmPasswordController.text);
  const String url = "http://10.0.2.2:8000/api/employee/employeeSignup";
try{
  http.Response response = await http.patch(Uri.parse(url),
    body: jsonEncode({
      'password': newPasswordController.text,
      'passwordConfirm': confirmPasswordController.text,
      'phone': numberSignUpController.text
    }),
    headers: {
    "Content-Type": "application/json"
    },

  );
  print(response.statusCode);
}
catch(e){
  print(e);
}


}
  Future<void>LoginFuntion()async{
    print(passwordController.text);
    const String url = "http://10.0.2.2:8000/api/employee/employeeLogin";
    try{
      http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'phone': numberController.text,

          'password': passwordController.text,


        }),
        headers: {
          "Content-Type": "application/json"
        },

      );
      if(response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottom_NavigationBar()));
      }
      else{
        errorAlert(context, "Incorrect phone number or password.");
      }

      print(response.statusCode);
    }
    catch(e){
      print(e);
    }


  }




  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this,initialIndex: 0);

    tabController.animateTo(_currentTabIndex);
    return ChangeNotifierProvider(
      create:(context)=> TextFormProvider(),
      builder: (context,child) {
        return Scaffold(
          body: Container(
            width: double.infinity,

            decoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.lightBlueAccent,
                      Color(0xff079AF5),

                    ]
                ),

            ),

            child: Column(

              children: [
                SizedBox(
                  height:
                  30,
                ),
                Container(
                  child: Language_Toggle(),
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
                                  key: _loginFormKey,
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
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                                  offset: Offset(1,2),
                                                  blurRadius: 2,
                                                  spreadRadius: 2
                                              ),


                                            ],

                                              color: Color(0xffF6F6F6),
                                              borderRadius: BorderRadius.circular(10)
                                          ),


                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your number';
                                              }

                                              return null;
                                            },


                                            controller: numberController,
                                            onSaved: (value){
                                              numberController.text = value!;
                                            },
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
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                                  offset: Offset(1,2),
                                                  blurRadius: 2,
                                                  spreadRadius: 4
                                              )
                                            ],

                                            color: Color(0xffF6F6F6),
                                            borderRadius: BorderRadius.circular(10)
                                          ),


                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your password';
                                              }

                                              return null;
                                            },
                                            obscureText: hidePassLogin,
                                            controller: passwordController,
                                            onSaved: (value){
                                              passwordController.text = value!;
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,


                                              hintText: AppLocalizations.of(context)!.passwordHint,
                                              hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 12),
                                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                                              suffixIcon: hidePassLogin
                                                  ? IconButton(
                                                icon: Icon(
                                                  Icons.visibility_off,
                                                  color: Colors.black54,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassLogin = !hidePassLogin;
                                                  });
                                                },
                                              )
                                                  : IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassLogin = !hidePassLogin;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.visibility,
                                                  color: Colors.black54,
                                                ),
                                              ),
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
                                                onPressed: () async{
                                                if(_loginFormKey.currentState!.validate()){
                                                  await LoginFuntion();


                                                }
                                                }, child: Text(AppLocalizations.of(context)!.login))),
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
                                                child: IconButton(onPressed: (){

                                                }, icon:Icon(Icons.fingerprint,color: Colors.white,size: 25,))),
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
    );
  }
  Widget signUp1(){
    return Form(
      key: _signUp1FormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your First Name';
                  }

                  return null;
                },
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Last Name';
                  }

                  return null;
                },
                controller: lastNameController,
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                controller: emailAddressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                      .hasMatch(value)) {
                    return "Please Enter Valid Email";
                  }
                  return null;
                },
                onSaved: (value){
                  emailAddressController.text = value!;
                },
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: FocusScope(
                onFocusChange: (value){
                  if(!value){
                    verifyPhone();
                  }
                  else{
                    print("hello");
                  }

                },
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Number';
                    }

                    return null;
                  },
                  controller: numberSignUpController,
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
                    onSaved: (value){
              numberSignUpController.text = value!;
              },


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
                      if(_signUp1FormKey.currentState!.validate()){
                        print("pressed");
                        setState(() {
                          activeIndex++;
                          _currentTabIndex = 1;
                        });
                      }
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
      key: _signUp2FormKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: ListView(
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your nid';
                  }

                  return null;
                },
                controller: nidController,
                onSaved: (value){
                  nidController.text = value!;
                },
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  // height: 60,
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: 6, vertical: 2),
                  // decoration: BoxDecoration(
                  //   //errorStyle: TextStyle(fontSize: 0),
                  //   borderRadius: BorderRadius.circular(6),
                  //   border: Border.all(
                  //       color: Colors.purple, width: 1.5),
                  // ),
                  child: DropdownButtonFormField<String>(
                    // decoration: InputDecoration(

                    //
                    // ),
                    value: genderValue,
                    isExpanded: true,

                    icon: Icon(Icons.arrow_drop_down,
                        color: Colors.lightGreen),
                    hint: Text(
                      AppLocalizations.of(context)!.gender,
                      style: TextStyle(
                          color: Colors.black54,
                         fontWeight: FontWeight.normal,
                      ),
                    ),
                    decoration: InputDecoration(
                      // filled: true,
                      errorStyle: TextStyle(fontSize: 0),
                      border: InputBorder.none,
                    ),
                    items: genderList.map(buildCountry).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.genderValue = value;
                        gender = value!;
                      });
                      //leaveType = value;
                      //checkleaveType();
                    },
                    validator: (value) => value == null ? '' : null,
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
      key: _signUp3FormKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: textFormField(numberController:companyController ,context: context,hintTxt: AppLocalizations.of(context)!.companyName,)
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return "Password too short";
                  }
                  return null;
                },
                controller: employeeTypeController,
                onSaved: (value){
                  employeeTypeController.text = value!;
                },
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return "Password too short";
                  }
                  return null;
                },
                controller: salaryController,
                onSaved: (value){
                  salaryController.text = value!;
                },
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
    key: _signUp4FormKey,
      child: Padding(
        padding: const EdgeInsets.only(top:16,left: 16,right: 16),
        child: ListView(
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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return "Password too short";
                  }
                  return null;
                },
                obscureText: true,
                controller: newPasswordController,
                onSaved: (value){
                  newPasswordController.text = value!;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: hidePassNew
                      ? IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassNew = !hidePassNew;
                      });
                    },
                  )
                      : IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassNew = !hidePassNew;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.black54,
                    ),
                  ),


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
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(1,2),
                        blurRadius: 2,
                        spreadRadius: 4
                    )
                  ],

                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10)
              ),


              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return "Password too short";
                  }
                  return null;
                },
                obscureText: true,
                controller: confirmPasswordController,
                onSaved: (value){
                  confirmPasswordController.text = value!;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: hidePassConf
                      ? IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassConf = !hidePassConf;
                      });
                    },
                  )
                      : IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassConf = !hidePassConf;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.black54,
                    ),
                  ),


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
                      signUp();

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
  DropdownMenuItem<String> buildCountry(dynamic item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );

}

class textForm extends StatelessWidget {
  const textForm({
    Key? key,
    required this.companyController,
    required this.context,
  }) : super(key: key);

  final TextEditingController companyController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }

        return null;
      },
      controller: companyController,
      onSaved: (value){
        companyController.text = value!;
      },
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


    );
  }
}

