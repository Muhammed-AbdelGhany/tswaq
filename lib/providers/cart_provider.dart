import 'package:flutter/cupertino.dart';
import 'package:tswaq/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItems => _cartItems;

  double get totalPrice {
    double total = 0;
    _cartItems.forEach((key, value) {
      total += (value.price * value.quantity);
    });
    return total;
  }

  addCartItem(String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (existingCartItem) {
        return Cart(
            id: existingCartItem.id,
            imageUrl: existingCartItem.imageUrl,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1,
            title: existingCartItem.title);
      });
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now(),
              imageUrl: imageUrl,
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }

  reduceCartItem(
    String productId,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (existingCartItem) {
        return Cart(
            id: existingCartItem.id,
            imageUrl: existingCartItem.imageUrl,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity - 1,
            title: existingCartItem.title);
      });
    }
    notifyListeners();
  }

  deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  removeAll() {
    _cartItems.clear();
    notifyListeners();
  }
}
