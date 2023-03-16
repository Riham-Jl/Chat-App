import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final String title;
  final VoidCallback onpressed;

   const MyButton({super.key,  required this.color, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(10),
        color: color,
        child: MaterialButton(
          onPressed: onpressed , 
          child: Text(title , style: const TextStyle(color: Colors.white),),
          ),
      ),
    );
  }
}