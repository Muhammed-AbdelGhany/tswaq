import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

class PopularProductWidget extends StatelessWidget {
  const PopularProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        height: 280,
        width: (MediaQuery.of(context).size.width - 40) * .7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_border_outlined),
                  ),
                  right: 4,
                  top: 4,
                ),
                Positioned(
                  top: 95,
                  right: 4,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: Text(
                      '\$ 99.9',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Rolex Watch',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Rolex ',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 22,
                      color: Colors.black,
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
