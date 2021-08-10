import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/widgets/product_widget.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  List items = [
    ProductWidget(),
    ProductWidget(),
    ProductWidget(),
    ProductWidget(),
    ProductWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feeds'),
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
        itemCount: items.length,
        itemBuilder: (context, i) {
          return ProductWidget();
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 2 : 2.2),
      ),
    );
  }
}
