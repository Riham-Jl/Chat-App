import 'package:flutter/material.dart';

showloading (context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text ("please wait"),
          content: SizedBox (height: 50 , child: Center (child: CircularProgressIndicator()),),
        );
      }
  );
}
