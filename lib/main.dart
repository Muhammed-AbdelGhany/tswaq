import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/bottom_bar.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/providers/dark_theme_provider.dart';
import 'package:tswaq/providers/product_provider.dart';
import 'package:tswaq/providers/wishlist_provider.dart';
import 'package:tswaq/screens/brands.dart';
import 'package:tswaq/screens/category_feeds.dart';
import 'package:tswaq/screens/feeds.dart';

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
          ChangeNotifierProvider(
            create: (_) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => WishlistProvider(),
          ),
        ],
        child: Consumer<DarkThemeProvider>(builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tswaq',
            theme: themeData(theme.darkTheme, context),
            home: BottomBar(),
            routes: {
              FeedScreen.routeName: (ctx) => FeedScreen(),
              CategoryFeedScreen.routeName: (ctx) => CategoryFeedScreen(),
              BrandsScreen.routeName: (ctx) => BrandsScreen(),
            },
          );
        }));
  }
}
