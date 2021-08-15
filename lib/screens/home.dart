import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/helpers/const_data.dart';
import 'package:tswaq/providers/product_provider.dart';
import 'package:tswaq/screens/brands.dart';
import 'package:tswaq/screens/cart.dart';
import 'package:tswaq/screens/feeds.dart';
import 'package:tswaq/widgets/category_widget.dart';
import 'package:tswaq/widgets/popular_product_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularProducts =
        Provider.of<ProductProvider>(context).popularProducts();
    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * .25,
        appBar: BackdropAppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.white],
              ),
            ),
          ),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          title: Text("Home"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Wish List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                  radius: 25,
                  backgroundColor: Colors.white),
            ),
          ],
        ),
        backLayer: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, Colors.white],
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 100,
              child: Transform.rotate(
                angle: 70,
                child: Container(
                  height: 400,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 200,
              child: Transform.rotate(
                angle: 70,
                child: Container(
                  height: 400,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BacklayerContent(
                        title: 'Feed',
                        icon: Feather.rss,
                        screen: FeedScreen(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BacklayerContent(
                        title: 'Cart',
                        icon: Feather.shopping_cart,
                        screen: CartScreen(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BacklayerContent(
                        title: 'WishList',
                        icon: Icons.favorite_outline,
                        screen: FeedScreen(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BacklayerContent(
                        title: 'Add a new product',
                        icon: Icons.upload_outlined,
                        screen: FeedScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        frontLayer: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  dotColor: Colors.white,
                  dotIncreasedColor: kPrimaryColor,
                  dotVerticalPadding: 0,
                  dotHorizontalPadding: 0,
                  images: [
                    ExactAssetImage(carouselImages[0]),
                    ExactAssetImage(carouselImages[1]),
                    ExactAssetImage(carouselImages[2]),
                    ExactAssetImage(carouselImages[3]),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) => CategoriesWidget(
                    title: categories[i]['category'],
                    image: categories[i]['photo'],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Popular Brands',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, BrandsScreen.routeName,
                            arguments: 'All');
                      },
                      child: Text(
                        ' View all...',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Swiper(
                  autoplay: true,
                  onTap: (index) {
                    Navigator.pushNamed(context, BrandsScreen.routeName,
                        arguments: brands[index]['brand']);
                    print(brands[index]['brand']);
                  },
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: new Image.asset(
                          brands[index]['photo'].toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  itemCount: brands.length,
                  // pagination: new SwiperPagination(),
                  control: new SwiperControl(
                    iconNext: null,
                    iconPrevious: null,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Popular Products',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FeedScreen.routeName,
                            arguments: true);
                      },
                      child: Text(
                        ' View all...',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularProducts.length,
                  itemBuilder: (ctx, i) => PopularProductWidget(
                    price: popularProducts[i].price,
                    description: popularProducts[i].description,
                    imageUrl: popularProducts[i].imageUrl,
                    isFavorite: popularProducts[i].isFavorit,
                    title: popularProducts[i].title,
                    id: popularProducts[i].id,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BacklayerContent extends StatelessWidget {
  final Widget? screen;
  final title;
  final IconData? icon;
  const BacklayerContent({
    Key? key,
    this.title,
    this.icon,
    this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => screen!),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            icon,
            size: 22,
          ),
        ],
      ),
    );
  }
}
