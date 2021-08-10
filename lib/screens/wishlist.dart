import 'package:flutter/material.dart';
import 'package:tswaq/widgets/empty_wishlist.dart';
import 'package:tswaq/widgets/full_wishlist.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  List wishList = [1];
  @override
  Widget build(BuildContext context) {
    return wishList.isEmpty
        ? Scaffold(
            body: EmptyWishList(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('WishList'),
            ),
            body: FullWishList(),
          );
  }
}
