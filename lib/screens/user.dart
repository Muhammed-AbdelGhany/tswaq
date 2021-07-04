import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/widgets/user_info_tile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Info',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 1,
        ),
        UserInfoTile(
          title: 'Email',
          subtitle: 'empty',
          icon: Feather.mail,
        ),
        UserInfoTile(
          title: 'Phone number',
          subtitle: 'empty',
          icon: Feather.phone,
        ),
        UserInfoTile(
          title: 'Shopping Adress',
          subtitle: 'empty',
          icon: Feather.truck,
        ),
        UserInfoTile(
          title: 'Join date',
          subtitle: 'empty',
          icon: Feather.clock,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'User Settings',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 1,
        ),
        ListTileSwitch(
          value: _switchValue,
          leading: const Icon(Feather.moon),
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
          switchActiveColor: kPrimaryColor,
          switchScale: 0.8,
          switchType: SwitchType.cupertino,
          title: const Text(
            'Dark Theme',
          ),
        ),
        UserInfoTile(
          title: 'Join date',
          subtitle: '',
          icon: Icons.logout,
        ),
      ],
    ));
  }
}
