import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatt_app/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

  UserCredential? credential;


signinfunc (context , myemail , mypassword ) async{


  
  try {
      showloading (context);
    credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: myemail,
    password: mypassword,
  );


  if( credential!=null){
     Navigator.of(context).pushNamedAndRemoveUntil("contacts", (route) => false);
}
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    Navigator.of(context).pop();
   AwesomeDialog (context: context , title: "Error" , 
   body: Container( padding: const EdgeInsets.only(bottom: 30), child: const Text("user-not-found" ,style: TextStyle(fontSize: 20),))).show();
  } else if (e.code == 'wrong-password') {
    Navigator.of(context).pop();
             AwesomeDialog (context: context , title: "Error" , body: Container(padding: const EdgeInsets.only(bottom: 30), child: const Text("wrong-password" , style: TextStyle(fontSize: 20),))).show();

  }
}


}