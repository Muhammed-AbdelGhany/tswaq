import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tswaq/widgets/empty_cart.dart';
import 'package:tswaq/widgets/full_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  List products = [1];
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Scaffold(
            body: EmptyCartScreen(),
          )
        : Scaffold(
            body: FullCartScreen(),
            appBar: AppBar(
              title: Text(
                'Cart Item Count',
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Feather.trash),
                ),
              ],
            ),
          );
  }
}
