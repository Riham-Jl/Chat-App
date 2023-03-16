import 'package:flutter/material.dart';
class MyTextFields extends StatelessWidget {
  final String hint;
  final String? Function(String?)? valid;
  final TextInputType? keyboardtype;
  final bool? ispassword;
  final void  Function(String?) onsaved;
const MyTextFields({super.key,  required this.hint , required this.onsaved , this.keyboardtype ,  this.ispassword, this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      keyboardType: keyboardtype,
      obscureText: ispassword==true?true:false,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange , width: 1) , borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue , width: 2) , borderRadius: BorderRadius.circular(10)),
      ),
      onSaved: onsaved
      ,
    );
  }
}