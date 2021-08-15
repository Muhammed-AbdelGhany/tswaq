import 'package:flutter/cupertino.dart';

class CartProvider {
  final id;
  final title;
  final imageUrl;
  final quantity;
  final price;

  CartProvider({
    this.id,
    this.title,
    this.imageUrl,
    this.quantity,
    this.price,
  });
}
