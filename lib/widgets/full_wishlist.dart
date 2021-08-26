import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/helpers/global_methods.dart';
import 'package:tswaq/providers/wishlist_provider.dart';

class FullWishList extends StatefulWidget {
  final productId;
  final id;
  final title;
  final imageUrl;
  final price;
  const FullWishList(
      {Key? key,
      this.productId,
      this.id,
      this.title,
      this.imageUrl,
      this.price})
      : super(key: key);

  @override
  _FullWishListState createState() => _FullWishListState();
}

class _FullWishListState extends State<FullWishList> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 50, bottom: 10, left: 10),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  // height: 100,
                  width: 120,
                  child: Image.network(
                    widget.imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        widget.title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(
                        '\$ ${widget.price}',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 33,
          top: 30,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.red),
            child: InkWell(
              splashColor: kAccentColor,
              onTap: () {
                showDilogWidget('Delete Item!',
                    'Are you sure you want to delete this items?', context, () {
                  wishlistProvider.deleteItem(widget.productId);
                });
              },
              child: Icon(
                Icons.clear,
              ),
            ),
          ),
        )
      ],
    );
  }
}
