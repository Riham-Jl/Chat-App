import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(children: [
        Image.asset("assets/logo.png" , height: 40,),
        const SizedBox(width: 15,),
        Text(title , style: const TextStyle(fontSize: 28),)
        ]),
       /* actions: [
          IconButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil("welcome", (route) => false);
            }, 
            icon: const Icon(Icons.exit_to_app)),
            
        ],*/
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}

