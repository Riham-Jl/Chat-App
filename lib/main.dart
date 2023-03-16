import 'package:chatt_app/screens/chat_screen.dart';
import 'package:chatt_app/screens/contacts_screen.dart';
import 'package:chatt_app/screens/imageview.dart';
import 'package:chatt_app/screens/signin_screen.dart';
import 'package:chatt_app/screens/signup_screen.dart';
import 'package:chatt_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



bool? islogin;

Future backgroundmessage(RemoteMessage message) async {
 // print(message.notification!.title);
  //print(message.data['name']);
  //print("========================================");
}




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundmessage);
  var user = FirebaseAuth.instance.currentUser;
  if (user==null){islogin=false;}
  else {islogin=true;}

    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch().copyWith(
      primary:  Colors.orange[800],
      secondary:  Colors.blue[800],),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold)
      )
      ),
     home: islogin==false ? const WelcomePage() : const ContactsPages(),  
    routes: {
    "welcome"   :(context) =>  const WelcomePage(),
    "signup"    : (context) => const SignupPage(),
    "signin"    : (context) => const SigninPage(),
    "contacts"  : (context) => const ContactsPages(),
    "chat"      : (context) => const ChatPage(),
    "imageview" : (context) => const ImageView()
  },    );
  }
}

