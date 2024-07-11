import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDialogs {
  static confirmDialog(
          {required BuildContext context,
          required void Function() onPressedYes,
          required String title}) =>
      CupertinoAlertDialog(title: Text(title), actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "cancel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor.withRed(180),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressedYes;
          },
          child: Text(
            "yes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor.withRed(180),
            ),
          ),
        ),
      ]);
}
