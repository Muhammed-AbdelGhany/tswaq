import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tswaq/constants/constants.dart';

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
        backLayer: Center(
          child: Text("Back Layer"),
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
                  onTap: (index) {},
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
            ],
          ),
        ),
      ),
    );
  }
}
