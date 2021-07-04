import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

class UserInfoTile extends StatelessWidget {
  final title;
  final subtitle;
  final IconData? icon;

  const UserInfoTile({
    Key? key,
    this.title,
    this.subtitle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: kAccentColor,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
