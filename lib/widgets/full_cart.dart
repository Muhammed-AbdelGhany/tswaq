import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tswaq/constants/constants.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({Key? key}) : super(key: key);

  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Theme.of(context).cardColor),
          child: Row(
            children: [
              Container(
                height: 160,
                width: 120,
                child: Image.network(
                  'https://thumbs.dreamstime.com/b/gold-watch-leather-strap-brown-white-face-31297366.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            'Rolex',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Entypo.cross),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                              child: Text(
                            ' 250\$',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Sub Total: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                              child: Text(
                            ' 250\$',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            'Ships Free',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Entypo.minus),
                                color: Colors.grey,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kPrimaryColor,
                                ),
                                alignment: Alignment.center,
                                height: 40,
                                width: 50,
                                child: Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Entypo.plus),
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            child: Column(
          children: [
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text('Checkout', style: TextStyle(fontSize: 22)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: [
                        Text(
                          'Price: ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                            child: Text(
                          ' US \$250.990',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.cyan,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}
