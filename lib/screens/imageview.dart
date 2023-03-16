import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});


  @override
  Widget build(BuildContext context) {
final arg = ModalRoute.of(context)?.settings.arguments as Map;
final imageurl = arg['imageurl'];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(child: Image.network(imageurl , fit: BoxFit.fill,)),
    );
  }
}