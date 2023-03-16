import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const DrawerListTile({
    Key? key, required this.title, required this.icon, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
     title: Text (title , style: const TextStyle(fontSize: 18),),
     leading: Icon (icon , size: 30,),
     onTap: onTap ,
    );
  }
}