import 'package:chatt_app/functions/signup_function.dart';
import 'package:chatt_app/widgets/mybutton_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../functions/validfunc.dart';
import '../widgets/mytextfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});


  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
GlobalKey<FormState> formstate =  GlobalKey<FormState>();

  String?  myemail , mypassword , myname;
  String? token;


 signUp() async{


  var formdata = formstate.currentState;
   if (formdata!.validate()){
     formdata.save();
     signupfunc(context, myname, myemail, mypassword, token); 
   } else {}
 }

gettoken () async {
   var fbm = FirebaseMessaging.instance;
   token = await fbm.getToken();
}

    @override
    void initState() {
      gettoken();
      super.initState();
      
    }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/logo.png" , height: screenHeight/4,),
                  MyTextFields(
                     hint: "Enter your name",
                     onsaved: (val){myname=val.toString();},
                     valid: (val) {return validInput(val!, 2, 40);},
                     ),
                  const SizedBox(height: 15,),
                  MyTextFields(hint: "Enter your Email",
                   onsaved: (val){myemail=val;},
                   valid: (val) {return validemailInput(val!, 5, 40);},
                    keyboardtype: TextInputType.emailAddress,),
                  const SizedBox(height: 15,),
                  MyTextFields(hint: "Enter your Password", 
                  onsaved: (val){mypassword=val.toString();} ,
                  valid: (val) {return validInput(val!, 5, 40);},
                   ispassword: true,),
                  MyButton(color: Colors.blue, title: "Sign Up", onpressed: ()async{
                      await signUp();
                
                    })
                
                ]),
            ),
          ),
        ))

    );
  }
}

