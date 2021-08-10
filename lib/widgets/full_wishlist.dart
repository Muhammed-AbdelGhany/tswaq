import 'package:flutter/material.dart';
import 'package:tswaq/constants/constants.dart';

class FullWishList extends StatefulWidget {
  const FullWishList({Key? key}) : super(key: key);

  @override
  _FullWishListState createState() => _FullWishListState();
}

class _FullWishListState extends State<FullWishList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 50),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  child: Image.network(
                    'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '\$ 200',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 33,
          top: 30,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.red),
            child: InkWell(
              splashColor: kAccentColor,
              onTap: () {},
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        )
      ],
    );
  }
}
