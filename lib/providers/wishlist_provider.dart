import 'package:flutter/cupertino.dart';
import 'package:tswaq/models/wishlist.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, Wishlist> _wishlistItems = {};

  Map<String, Wishlist> get wishlistItems => _wishlistItems;

  addWishlistItem(
      String productId, String imageUrl, double price, String title) {
    if (_wishlistItems.containsKey(productId)) {
      deleteItem(productId);
    } else {
      _wishlistItems.putIfAbsent(
        productId,
        () => Wishlist(
            id: DateTime.now(), imageUrl: imageUrl, price: price, title: title),
      );
    }
    notifyListeners();
  }

  deleteItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}
