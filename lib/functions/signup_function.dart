import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/loading.dart';

  UserCredential? credential;
CollectionReference usersref = FirebaseFirestore.instance.collection("users");

signupfunc(context ,myname , myemail , mypassword , token ) async {
  
     try {
            showloading (context);
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: myemail,
         password: mypassword,
       );
        
       if (credential != null){
             await usersref.add({
        "name": myname,
        "email" : myemail,
        "token" : token ,
      }).catchError((e){print (e);});

       await FirebaseMessaging.instance.subscribeToTopic('mytopic');
              
        Navigator.of(context).pushNamedAndRemoveUntil("contacts", (route) => false);
        return credential;
              }
         else {}
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
        Navigator.of(context).pop();
         AwesomeDialog (
          context: context ,
          title: "Error" ,
          body: Container( padding: const EdgeInsets.only(bottom: 30), child: const Text("password is too weak"))).show();
       } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        AwesomeDialog (
          context: context ,
          title: "Error" ,
          body: Container( padding: const EdgeInsets.only(bottom: 30), child: const Text("email-already-in-use"))).show();
       }
     } catch (e) {
       print(e);
     }

}