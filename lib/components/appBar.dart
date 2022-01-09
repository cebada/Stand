import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class StandAppBar extends StatelessWidget with PreferredSizeWidget{

  final String username;
  final String menu;

  StandAppBar(this.username, this.menu);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(menu),
      backgroundColor: Colors.red[600],
      actions: [
        IconButton(
          onPressed: () {
            createAlertDialogLogout(
                context,
                "Do you want to logout $username?",
                Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                  size: 72.0,
                ));
          },
          icon: Icon(Icons.person),
        )
      ],
    );
  }


  createAlertDialogLogout(BuildContext context, String message, Icon icon) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(message),
              content: icon,
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.LoginRoute, (route) => false);
                  },
                  child: Text("Logout", style: TextStyle(color: Colors.red[600])),
                ),
              ]);
        });
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}