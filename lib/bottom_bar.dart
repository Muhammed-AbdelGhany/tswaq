import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/screens/cart.dart';
import 'package:tswaq/screens/feeds.dart';
import 'package:tswaq/screens/home.dart';
import 'package:tswaq/screens/search.dart';
import 'package:tswaq/screens/user.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Map<String, dynamic>> _pages = [];

  int _selectedPage = 1;

  void _selectedIndext(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        'page': HomeScreen(),
      },
      {
        'page': FeedScreen(),
      },
      {
        'page': SearchScreen(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserScreen(),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (value) => _selectedIndext(value),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Feather.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Feather.rss),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Feather.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Feather.user),
              label: 'User',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedPage = 2;
          });
        },
        backgroundColor: Colors.pink,
        child: Icon(Feather.search),
      ),
    );
  }
}
