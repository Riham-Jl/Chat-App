import 'package:chatt_app/functions/addmessage_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/sendimage_function.dart';
import '../functions/validfunc.dart';
import '../widgets/messages_widget.dart';
import '../widgets/myappbar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});


  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

    User? myuser = FirebaseAuth.instance.currentUser;
    late bool isme;
    String textmessage = "";
    final textfieldcontroller = TextEditingController();

    CollectionReference messagesref = FirebaseFirestore.instance.collection("messages");

 
  
  @override
  Widget build(BuildContext context) {
        final contactdata = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: MyAppBar(title: contactdata['name']),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder (
        stream: messagesref.where("sender_reciever", whereIn: [[myuser!.email , contactdata['email']] , [contactdata['email'] , myuser!.email] ]).orderBy('time' , descending: true).snapshots(),
        builder: (context, snapshot)  {
          if (snapshot.hasData){
          return Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(15),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,i){
                var data = snapshot.data!.docs[i];
                if (data.get('senderemail')== myuser!.email){isme=true;}
                else {isme=false;}
                return Messageswidget(data: data ,isme: isme );
              }),
          )
          ;
          }
          if (snapshot.hasError){return const Text("error");}
          return (const Center (child: CircularProgressIndicator()));
        }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.orange))),
            child: Row(
            children: [
              Expanded(child: TextFormField(
                validator: (val) {return validemailInput(val!, 1, 100);},
                controller: textfieldcontroller,
                onChanged: (val){
                  textmessage=val;
                },
                decoration: const InputDecoration(
                  hintText: "Write your message here...",
                  border: InputBorder.none
                ) ,)),
                IconButton(
                  onPressed:()async {
                     await pickimg(ImageSource.gallery , context , contactdata);
                     },
                   icon: const Icon(Icons.photo_outlined)),
                   IconButton(
                  onPressed: () async{ await pickimg(ImageSource.camera , context , contactdata);},
                   icon: const Icon(Icons.camera_alt_rounded)),
                GestureDetector(
                  child: const Text("send" ,style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold),),
                  onTap: () async{
                    var message = textmessage;
                    textmessage= "";
                    await addmessagefunc(message , textfieldcontroller , contactdata);
                    
                  },)
                ],
          ),)

        ]),
    );
  }
}

