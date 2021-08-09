import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/widgets/popular_product_widget.dart';
import 'package:tswaq/widgets/product_widget.dart';

class BrandsScreen extends StatefulWidget {
  final index;
  const BrandsScreen({Key? key, this.index}) : super(key: key);

  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  List<Map<String, Object>> brandProducts = [
    {
      'brand': 'H&m',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Huwaui',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Nike',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Samsung',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Dell',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Addidas',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
    {
      'brand': 'Apple',
      'products': [
        {
          'name': 'Rolex',
          'image':
              'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg'
        }
      ],
    },
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.white],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandProducts.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.pink, Colors.white],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              width: 2,
                              color: _currentIndex == i
                                  ? Colors.black
                                  : Colors.transparent)),
                      child: Text(
                        brandProducts[i]['brand'].toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .78,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (ctx, i) => ProductWidget(),
              ),
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
