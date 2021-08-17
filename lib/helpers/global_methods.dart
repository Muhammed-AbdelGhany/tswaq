import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

Future<void> showDilogWidget(
    String title, String content, BuildContext context, Function fct) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancle',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                fct();
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        );
      });
}
