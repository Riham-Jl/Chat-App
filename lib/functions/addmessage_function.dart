import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;




CollectionReference messagesref = FirebaseFirestore.instance.collection("messages");
CollectionReference usersref = FirebaseFirestore.instance.collection("users");
    var myemail = FirebaseAuth.instance.currentUser?.email;
    String? username , mytoken;
    
    

addmessagefunc(textmessage , textfieldcontroller , contactdata ) async{

  if (textmessage!=""){

 await usersref.where("email", isEqualTo: myemail).limit(1).get().then((value){
      for (var element in value.docs) {
         username = element['name'];
         mytoken = element['token'];
      } });
         textfieldcontroller.clear();
        await messagesref.add({
        "text" : textmessage,
        "sendername" : username,
        "senderemail" : myemail,
        "recieveremail": contactdata["email"],
        "sender_reciever":[ myemail , contactdata["email"]],
        "time": FieldValue.serverTimestamp()
      }).catchError((e){print (e);});
    

  
var serverToken = "AAAAPVJDf7k:APA91bFwqayQwtsjCaAneB9dIE-WotzA8Pvurr_-6n2Di9qLzXGNf1ic_TIboXxHk52IDAjLdScU7advN4V7d3Iw9SO3MfSZSGjgKAJmaWAAGW1fEpscJWzaVaUKPwVWiOZJztVMBCn2";
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': textmessage,
            'title': FirebaseAuth.instance.currentUser!.email
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'name' : username,
            'email' : myemail,
            'token' : mytoken
            
          },
          'to' : contactdata['token']
          //'to': "/topics/mytopic"
          //'to' : "dZp1L43-SGCFvlv4Ib-9Vn:APA91bH8zqefG3gVDR2E_DXfFkHdFUOgoMljKMQwV15vz7wW00DMFlnQum216_1bzF5rqfg02BE6TMk9zup8WCNpGjd__QEUBJohntSFCu8ZTnd-5A76q-IoVQc4Y6VjHVOr8IWPM3Qc",
         //imulator 'to': "cpFEm-zRReCb4rXtJm_aLN:APA91bHMIm1im0Qd3T-PrIxv_l8PXpD9WBoUUty9YewEsQ3CzdutRvLd5bDYMPrXSimOnP1nKfVxPLWTze3cqZpEkFOlC4rtGizGLOEooJnPQeYZd_JsGt-2oGzzMYEjz5dcV7UvsVCN",
        },
      ),
    );}

}