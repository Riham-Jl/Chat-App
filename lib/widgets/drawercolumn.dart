import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'drawerlisttile.dart';

class DrawerColumn extends StatelessWidget {
  const DrawerColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
         const DrawerListTile(
          title: "Home",
          icon: Icons.home,
         ),
         const DrawerListTile(
          title: "Help",
          icon: Icons.help,
         ),
         const DrawerListTile(
          title: "About",
          icon: Icons.help_center,
         ),
         DrawerListTile(
          title: "Sign out",
          icon: Icons.exit_to_app,
          onTap: () async{
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamedAndRemoveUntil("welcome", (route) => false);
          },
         ),
         
        
    ],
        );
  }
}

