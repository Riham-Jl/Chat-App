import 'package:chatt_app/widgets/mybutton_widget.dart';
import 'package:chatt_app/widgets/mytextfield.dart';
import 'package:flutter/material.dart';
import '../functions/signin_function.dart';
import '../functions/validfunc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});


  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  GlobalKey<FormState> formstate =  GlobalKey<FormState>();
  String? myemail , mypassword;


  signin () async{
    var formdata = formstate.currentState;
   if (formdata!.validate()){ 
         formdata.save();
      
     
         signinfunc(context , myemail , mypassword);
     
   } else {}
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
                  const SizedBox(height: 150,),
                  Image.asset("assets/logo.png" , height: screenHeight/4,),
                  MyTextFields(
                    hint: "Enter your Email",
                    onsaved: (val){myemail=val;} , 
                    keyboardtype: TextInputType.emailAddress,
                    valid: (val) {return validemailInput(val!, 5, 40);}),
                  const SizedBox(height: 15,),
                  MyTextFields(
                    hint: "Enter your Password",
                    onsaved: (val){mypassword=val.toString();} ,
                    ispassword: true,
                    valid: (val) {return validInput(val!, 5, 40);}),
                  MyButton(
                    color: Colors.blue,
                     title: "Sign In",
                      onpressed: ()async{
                          await signin();
                          })
                ]),
            ),
          ),
        ))

    );
  }
}