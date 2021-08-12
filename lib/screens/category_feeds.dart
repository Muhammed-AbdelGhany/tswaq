import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:tswaq/providers/product_provider.dart';
import 'package:tswaq/widgets/product_widget.dart';

class CategoryFeedScreen extends StatelessWidget {
  CategoryFeedScreen({Key? key}) : super(key: key);
  static const routeName = '/category-feeds';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<ProductProvider>(context);
    final _products = productProvider.productsWithCategory(category);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.white],
            ),
          ),
        ),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 2,
        itemCount: _products.length,
        itemBuilder: (context, i) {
          return ProductWidget(
            isFavorite: _products[i].isFavorit,
            id: _products[i].id,
            title: _products[i].title,
            imageUrl: _products[i].imageUrl,
            price: _products[i].price,
            quantity: _products[i].quantity,
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 2 : 2.2),
      ),
    );
  }
}
