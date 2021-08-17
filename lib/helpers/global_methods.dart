import 'package:flutter/material.dart';

Future<void> showDilog(
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
