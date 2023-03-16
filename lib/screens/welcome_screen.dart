import 'package:flutter/material.dart';

import '../widgets/mybutton_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}


class _WelcomePageState extends State<WelcomePage> {

  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/logo.png" , height: screenHeight/4,),
            Text("MessageMe" , style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center,),
            MyButton(
              title: "Sign In",
               color: Theme.of(context).colorScheme.secondary, 
               onpressed:(){ Navigator.of(context).pushNamed("signin");}),
            MyButton(
              title: "Sign Up",
               color: Theme.of(context).colorScheme.primary, 
               onpressed: (){Navigator.pushNamed(context,"signup");}
                )

   ] )));
  }
}

