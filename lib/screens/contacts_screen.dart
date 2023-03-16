import 'package:chatt_app/widgets/myappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../widgets/desktopdrawer.dart';
import '../widgets/mobiledrawer.dart';



class ContactsPages extends StatefulWidget {
  
  const ContactsPages({super.key});


  @override
  State<ContactsPages> createState() => _ContactsPagesState();
}

class _ContactsPagesState extends State<ContactsPages> {

    User? myuser = FirebaseAuth.instance.currentUser;
    CollectionReference usersref = FirebaseFirestore.instance.collection("users");

    

    FirebaseMessaging fbm = FirebaseMessaging.instance;
    Map data = {};
     


  @override
  void initState() {
    


    fbm.getToken().then((value) {
      //print("=================token======================");
      //print(value);
    });


FirebaseMessaging.onMessageOpenedApp.listen((message) {
      //print ("please go to chat");
      //print(message.data["name"]);
      Navigator.of(context).pushNamed("chat" , arguments: { "name": message.data['name'],"email": message.data['email'] , "token" : message.data['token']},);
    });   

    FirebaseMessaging.onMessage.listen((event) {
     // print(event.notification!.body);
     showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text ("${event.notification!.title}"),
              content: Text ("${event.notification!.body}"),
              actions: [
                ElevatedButton(onPressed:(){
             Navigator.of(context).pushReplacementNamed("chat" , arguments: { "name": event.data['name'],"email": event.data['email'] , "token" : event.data['token']},);
                }, child: const Text ("view message")),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text ("cancel"))
              ],
              //backgroundColor: Colors.white,
              //titlePadding: EdgeInsets.all (10),
            );
          });

    });
    
    super.initState();
  }

 
    @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width<600;
    return Scaffold(
      appBar: const MyAppBar(title: "Contacts"),
      drawer: isMobile? const MobileDrawer():null,
      body: Row(
        children: [
          !isMobile? const DesktopDrawer():Container(),
          Expanded(
            child: FutureBuilder (
              future: usersref.where("email" , isNotEqualTo: myuser!.email).get(),
              builder: (context, snapshot)  {
                if (snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,i){
                    var data = snapshot.data!.docs[i];
                      return Card(
                        child: ListTile(
                          title: Text (data.get("name")),
                          subtitle: Text (data.get("email")),
                          leading: const CircleAvatar(child: Icon(Icons.person)),
                          onTap: (){
                            Navigator.of(context).pushNamed("chat" , arguments: { "name": data.get('name'),"email": data.get('email') , "token" : data.get('token')},);
                          },
                        ),
                      );
                    })
                  ;}
                if (snapshot.hasError){return const Text("error");}
                return (const Center (child: CircularProgressIndicator()));
              }),
          ),
        ],
      ),
    );
  }
}

