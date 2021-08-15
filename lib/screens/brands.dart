import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/models/product.dart';
import 'package:tswaq/providers/product_provider.dart';
import 'package:tswaq/widgets/product_widget.dart';

class BrandsScreen extends StatefulWidget {
  static const routeName = '/brands';
  final index;
  const BrandsScreen({Key? key, this.index}) : super(key: key);

  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  List brandProducts = [
    'H&M',
    'Huawei',
    'Nike',
    'Samsung',
    'Dell',
    'Addidas',
    'Apple',
    'All',
  ];
  int _currentIndex = 0;

  String? brand;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    brand = ModalRoute.of(context)!.settings.arguments as String;
    _currentIndex = brandProducts.indexWhere((element) => element == brand);
    print(_currentIndex);
    super.didChangeDependencies();
  }
  // @override
  // void initState() {
  //   _currentIndex = widget.index;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    List<Product> _products = productProvider.productsWithBrand(brand!);
    if (brand == 'All') {
      _products = productProvider.products;
    }
    //final _products = productProvider.products;

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
                        brand = brandProducts[i];

                        print("$brand");
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
                        brandProducts[i],
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
                itemCount: _products.length,
                itemBuilder: (ctx, i) => ProductWidget(
                  isFavorite: _products[i].isFavorit,
                  id: _products[i].id,
                  title: _products[i].title,
                  imageUrl: _products[i].imageUrl,
                  price: _products[i].price,
                  quantity: _products[i].quantity,
                ),
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
