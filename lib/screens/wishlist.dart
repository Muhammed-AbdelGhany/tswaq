import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/models/wishlist.dart';
import 'package:tswaq/providers/wishlist_provider.dart';
import 'package:tswaq/widgets/empty_wishlist.dart';
import 'package:tswaq/widgets/full_wishlist.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItems = wishlistProvider.wishlistItems;
    return wishlistItems.isEmpty
        ? Scaffold(
            body: EmptyWishList(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('WishList (${wishlistItems.length})'),
            ),
            body: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * .70,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: wishlistItems.length,
                  itemBuilder: (ctx, i) => FullWishList(
                        productId: wishlistItems.keys.toList()[i],
                        id: wishlistItems.values.toList()[i].id,
                        imageUrl: wishlistItems.values.toList()[i].imageUrl,
                        price: wishlistItems.values.toList()[i].price,
                        title: wishlistItems.values.toList()[i].title,
                      )),
            ),
          );
  }
}
