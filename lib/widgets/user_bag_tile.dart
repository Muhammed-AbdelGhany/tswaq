import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

class UserBagTile extends StatelessWidget {
  final title;

  final count;
  final IconData? icon;
  Widget? screen;

  UserBagTile({
    Key? key,
    this.title,
    this.icon,
    this.count,
    this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => screen!));
        },
        splashColor: kAccentColor,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Text(count),
        ),
      ),
    );
  }
}
