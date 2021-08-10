import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/screens/brands.dart';
import 'package:tswaq/screens/cart.dart';
import 'package:tswaq/screens/feeds.dart';
import 'package:tswaq/widgets/category_widget.dart';
import 'package:tswaq/widgets/popular_product_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List swiperImages = [
    'assets/images/h&m.jpg',
    'assets/images/Huawei.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/Dell.jpg',
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
  ];
  List<Map<String, Object>> categories = [
    {'category': 'Phones', 'photo': 'assets/images/CatPhones.png'},
    {'category': 'Clothes', 'photo': 'assets/images/CatClothes.jpg'},
    {'category': 'Laptops', 'photo': 'assets/images/CatLaptops.png'},
    {'category': 'Beauty', 'photo': 'assets/images/CatBeauty.jpg'},
    {'category': 'Furniture', 'photo': 'assets/images/CatFurniture.jpg'},
    {'category': 'Shoes', 'photo': 'assets/images/CatShoes.jpg'},
    {'category': 'Watches', 'photo': 'assets/images/CatWatches.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      ' View all...',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BrandsScreen(
                          index: index,
                        ),
                      ),
                    );
                  },
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: new Image.asset(
                          swiperImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  itemCount: swiperImages.length,
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
                    Text(
                      ' View all...',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                  itemCount: 6,
                  itemBuilder: (ctx, i) => PopularProductWidget(),
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
