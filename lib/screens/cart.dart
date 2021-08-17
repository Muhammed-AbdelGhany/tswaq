import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/helpers/global_methods.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/widgets/empty_cart.dart';
import 'package:tswaq/widgets/full_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    return cartItems.isEmpty
        ? Scaffold(
            body: EmptyCartScreen(),
          )
        : Scaffold(
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .70,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (ctx, i) => FullCartScreen(
                  productId: cartItems.keys.toList()[i],
                  id: cartItems.values.toList()[i].id,
                  imageUrl: cartItems.values.toList()[i].imageUrl,
                  price: cartItems.values.toList()[i].price,
                  quantity: cartItems.values.toList()[i].quantity,
                  title: cartItems.values.toList()[i].title,
                ),
              ),
            ),
            bottomSheet: CheckoutWidget(),
            appBar: AppBar(
              title: Text(
                'Cart (${cartProvider.cartItems.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showDilogWidget(
                        'Items Remove',
                        'Do you want to remove all items ?',
                        context,
                        () => cartProvider.removeAll());
                  },
                  icon: Icon(Feather.trash),
                ),
              ],
            ),
          );
  }
}
