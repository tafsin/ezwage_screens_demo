import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class textFormField extends StatelessWidget {
  const textFormField({
    Key? key,
    required this.numberController,
    required this.context,
    required this.hintTxt,


  }) : super(key: key);

  final TextEditingController numberController;
  final BuildContext context;
  final String hintTxt;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }

        return null;
      },

      controller: numberController,
      onSaved: (value){
        numberController.text = value!;
      },
      decoration: InputDecoration(
        border: InputBorder.none,



        hintText: hintTxt,
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