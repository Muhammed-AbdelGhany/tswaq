import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/providers/cart_provider.dart';
import 'package:tswaq/providers/product_provider.dart';
import 'package:tswaq/widgets/product_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final id;
  const ProductDetailsScreen({Key? key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final products = productProvider.products;
    final productDetails = productProvider.productDetails(id);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).cardColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            child: Container(
              margin: EdgeInsets.all(60),
              child: Image.network(
                productDetails.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.save, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productDetails.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            '\$ ${productDetails.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            productDetails.description!,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Brand: ',
                            value: productDetails.brand,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Quantity: ',
                            value: '${productDetails.quantity}',
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Category: ',
                            value: '${productDetails.productCategoryName}',
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Popularity: ',
                            value: productDetails.isPopular!
                                ? "Popular "
                                : "Not Popular ",
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text(
                                  'No reviews yet',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  'Be the first reviwer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'Suggested Products:',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 350,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (ctx, i) => ProductWidget(
                                id: products[i].id,
                                imageUrl: products[i].imageUrl,
                                isFavorite: products[i].isFavorit,
                                price: products[i].price,
                                quantity: products[i].quantity,
                                title: products[i].title,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('Details'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Feather.heart, color: Colors.pink),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Feather.shopping_cart,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap:
                          cartProvider.cartItems.containsKey(productDetails.id)
                              ? null
                              : () {
                                  cartProvider.addCartItem(
                                      productDetails.id!,
                                      productDetails.price!,
                                      productDetails.title!,
                                      productDetails.imageUrl!);
                                },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        color: cartProvider.cartItems
                                .containsKey(productDetails.id)
                            ? Colors.grey
                            : Colors.red,
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BUY NOW',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.credit_card,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        color: Colors.grey,
                        child: Icon(
                          Feather.heart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BrandInfoWidget extends StatelessWidget {
  final title;
  final value;
  const BrandInfoWidget({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}
