import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/providers/wishlist_provider.dart';
import 'package:tswaq/screens/product_details.dart';

class PopularProductWidget extends StatelessWidget {
  final title;
  final id;
  final description;
  final imageUrl;
  final price;
  bool? isFavorite = false;
  PopularProductWidget({
    Key? key,
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
              id: id,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 280,
        width: (MediaQuery.of(context).size.width - 40) * .7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      wishlistProvider.addWishlistItem(
                          id, imageUrl!, price!, title!);
                    },
                    child: Icon(
                        wishlistProvider.wishlistItems.containsKey(id)
                            ? Icons.star
                            : Icons.star_border_outlined,
                        color: Colors.orangeAccent),
                  ),
                  right: 4,
                  top: 4,
                ),
                Positioned(
                  top: 95,
                  right: 4,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: FittedBox(
                      child: Text(
                        '\$ $price',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        description,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: cartProvider.cartItems.containsKey(id)
                            ? null
                            : () {
                                cartProvider.addCartItem(
                                    id, price, title, imageUrl);
                              },
                        iconSize: 22,
                        color: Colors.black,
                        icon: Icon(cartProvider.cartItems.containsKey(id)
                            ? Icons.check
                            : Icons.add_shopping_cart),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
