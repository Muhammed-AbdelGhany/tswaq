import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/models/cart.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/screens/product_details.dart';

class FullCartScreen extends StatefulWidget {
  final productId;
  final id;
  final title;
  final price;
  final quantity;
  final imageUrl;

  FullCartScreen({
    Key? key,
    this.productId,
    this.id,
    this.title,
    this.price,
    this.imageUrl,
    this.quantity,
  }) : super(key: key);

  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
              id: widget.productId,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            Container(
              height: 160,
              width: 120,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        IconButton(
                          onPressed: () {
                            cartProvider.deleteItem(widget.productId);
                          },
                          icon: Icon(Entypo.cross),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Row(
                      children: [
                        Flexible(
                            child: Text(
                          'Price: ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Flexible(
                            child: Text(
                          '${widget.price}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Row(
                      children: [
                        Flexible(
                            child: Text(
                          'Sub Total: ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        )),
                        Flexible(
                            child: Text(
                          ' ${(widget.price * widget.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          'Ships Free',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Row(
                          children: [
                            IconButton(
                              onPressed: widget.quantity < 2
                                  ? null
                                  : () {
                                      cartProvider.reduceCartItem(
                                        widget.productId,
                                      );
                                    },
                              icon: Icon(Entypo.minus),
                              color: widget.quantity < 2
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kPrimaryColor,
                              ),
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child: Text(
                                '${widget.quantity}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cartProvider.addCartItem(
                                    widget.productId,
                                    widget.price,
                                    widget.title,
                                    widget.imageUrl);
                              },
                              icon: Icon(Entypo.plus),
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
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

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: .1)),
        height: MediaQuery.of(context).size.height * .08,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text('Checkout', style: TextStyle(fontSize: 22)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: [
                        Text(
                          'Price: ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                            child: Text(
                          ' US \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.cyan,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
