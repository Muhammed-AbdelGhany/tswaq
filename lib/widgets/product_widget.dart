import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/providers/wishlist_provider.dart';
import 'package:tswaq/screens/product_details.dart';

class ProductWidget extends StatelessWidget {
  final title;
  final id;
  final imageUrl;
  final price;
  final quantity;
  final isFavorite;

  const ProductWidget(
      {Key? key,
      this.isFavorite,
      this.id,
      this.title,
      this.imageUrl,
      this.price,
      this.quantity})
      : super(key: key);

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
        height: 325,
        width: (MediaQuery.of(context).size.width - 40) * .5,
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
                  height: 217,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(color: Colors.white),
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
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '\$ $price',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Quanitiy: ',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          '$quantity left',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return Dialog(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    color: Theme.of(context).backgroundColor,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .4 -
                                              20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .8,
                                          child: Image.network(
                                            imageUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Container(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: IconButton(
                                                  // hoverColor: Colors.white,
                                                  onPressed: () {
                                                    wishlistProvider
                                                        .addWishlistItem(
                                                            id,
                                                            imageUrl!,
                                                            price!,
                                                            title!);
                                                    Navigator.canPop(context)
                                                        ? Navigator.pop(context)
                                                        : null;
                                                  },
                                                  color: wishlistProvider
                                                          .wishlistItems
                                                          .containsKey(id)
                                                      ? Colors.red
                                                      : Colors.black,
                                                  icon: Icon(
                                                      Icons.favorite_outline),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: IconButton(
                                                  hoverColor: Colors.white,
                                                  onPressed: () {
                                                    Navigator.canPop(context)
                                                        ? Navigator.pop(context)
                                                        : null;
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                ProductDetailsScreen(
                                                                    id: id)));
                                                  },
                                                  icon: Icon(Icons
                                                      .remove_red_eye_outlined),
                                                ),
                                              ),
                                              Container(
                                                // margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: IconButton(
                                                  // hoverColor: Colors.white,
                                                  onPressed: cartProvider
                                                          .cartItems
                                                          .containsKey(id)
                                                      ? null
                                                      : () {
                                                          cartProvider
                                                              .addCartItem(
                                                                  id,
                                                                  price,
                                                                  title,
                                                                  imageUrl);
                                                          Navigator.canPop(
                                                                  context)
                                                              ? Navigator.pop(
                                                                  context)
                                                              : null;
                                                        },

                                                  icon: cartProvider.cartItems
                                                          .containsKey(id)
                                                      ? Icon(Icons.check)
                                                      : Icon(Icons
                                                          .shopping_cart_outlined),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        iconSize: 14,
                        color: Colors.grey,
                        icon: Icon(Icons.more_horiz),
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
