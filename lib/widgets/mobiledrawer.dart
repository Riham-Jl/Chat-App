import 'package:chatt_app/widgets/drawercolumn.dart';
import 'package:flutter/material.dart';
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange,
        padding: const EdgeInsets.only(top: 120),
        child: const DrawerColumn()
      ));
  }
}



