import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/bottom_bar.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/providers/dark_theme_provider.dart';

import 'helpers/shared_prefrences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  void changeThemeData() async {
    darkThemeProvider.darkTheme = await getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    changeThemeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DarkThemeProvider(),
          ),
        ],
        child: Consumer<DarkThemeProvider>(builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tswaq',
            theme: themeData(theme.darkTheme, context),
            home: BottomBar(),
          );
        }));
  }
}
