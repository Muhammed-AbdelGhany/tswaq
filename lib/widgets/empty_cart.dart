import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/providers/dark_theme_provider.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: height * .3,
              width: double.infinity,
              child: Image.asset(
                'assets/images/emptycart.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your Cart Is Empty',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            'Looks like you didn\'t add any item to your cart yet!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: height * .15),
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {},
              child: Text(
                'SHOP NOW',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
