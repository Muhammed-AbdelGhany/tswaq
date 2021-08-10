import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tswaq/widgets/product_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).cardColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .45,
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            child: Container(
              margin: EdgeInsets.all(60),
              child: Image.network(
                'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg',
                fit: BoxFit.cover,
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
                            'Title',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            '\$ 16',
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
                            'Description',
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
                            value: "BrandName",
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Quantity: ',
                            value: "12 Left",
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Category: ',
                            value: "CategoryName",
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          BrandInfoWidget(
                            title: 'Popularity: ',
                            value: "Popular",
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
                              itemCount: 6,
                              itemBuilder: (ctx, i) => ProductWidget(),
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
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        color: Colors.red,
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
