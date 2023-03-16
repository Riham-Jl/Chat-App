import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Messageswidget extends StatelessWidget {
   const Messageswidget({super.key, required this.data, required this.isme}) ;


   final QueryDocumentSnapshot<Object?> data;
   final bool isme;



  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: isme?CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(data.get('senderemail')),
        data.get('text')!=null?
        Container(
          padding: const EdgeInsets.symmetric(vertical:10 , horizontal: 20),
          decoration: BoxDecoration(
            color: isme? Colors.blue[800] : Colors.orange[800],
            //border: Border.all(width: 1),
            borderRadius:
             isme? const BorderRadius.only(topLeft:  Radius.circular(20), bottomLeft:  Radius.circular(20) , bottomRight:  Radius.circular(20))
                 : const BorderRadius.only(topRight:  Radius.circular(20), bottomLeft:  Radius.circular(20) , bottomRight:  Radius.circular(20)),
          ),                        
          child:Text (data.get('text') , style: const TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),)
          
          )
          :InkWell(
            child: Image.network(data.get('imageurl') ,height: 120),
            onTap: (){
              Navigator.of(context).pushNamed("imageview" ,  arguments: {"imageurl": data.get('imageurl')},);
            },),
          const SizedBox(height: 10,),
      ],
    );
  }
}