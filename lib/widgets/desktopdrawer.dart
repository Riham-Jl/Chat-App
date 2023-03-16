import 'package:chatt_app/widgets/drawercolumn.dart';
import 'package:flutter/material.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: Colors.orange,
       padding: const EdgeInsets.only(top: 120),
    child: const DrawerColumn(),
      );
  }
}

