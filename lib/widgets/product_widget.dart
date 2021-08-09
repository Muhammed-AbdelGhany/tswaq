import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 325,
      width: (MediaQuery.of(context).size.width - 40) * .5,
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
                height: 217,
                width: double.infinity,
                child: Image.network(
                  'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 1,
                left: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'New',
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '\$ 197.0',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
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
                        'Quanitiy: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        '12 left',
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
                    iconSize: 14,
                    color: Colors.grey,
                    icon: Icon(Icons.more_horiz),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
