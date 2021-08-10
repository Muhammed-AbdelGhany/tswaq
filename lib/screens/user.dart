import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:tswaq/constants/constants.dart';
import 'package:tswaq/providers/dark_theme_provider.dart';
import 'package:tswaq/screens/cart.dart';
import 'package:tswaq/screens/wishlist.dart';
import 'package:tswaq/widgets/user_bag_tile.dart';
import 'package:tswaq/widgets/user_info_tile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _controller,
            slivers: [
              //to control all page
              SliverAppBar(
                // app bar with options
                expandedHeight: 200,
                elevation: 5,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder: (ctx, constrains) {
                  var top = constrains
                      .biggest.height; // get the current heigh from controlelr

                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.white],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0, 1],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      // changable bar hight
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        children: [
                          AnimatedOpacity(
                            opacity: top <= 110
                                ? 1
                                : 0, // if hight < 110 show the following
                            duration: Duration(milliseconds: 300),
                            child: Row(
                              // what will show
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 2,
                                  width: kToolbarHeight / 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        // what is shown if > 110
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                // the content that takes the space from the bar
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'User Bag',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    UserBagTile(
                      title: 'Withlist',
                      icon: Feather.heart,
                      count: "6",
                      screen: WishListScreen(),
                    ),
                    UserBagTile(
                      title: 'Cart',
                      icon: Feather.shopping_cart,
                      count: "2",
                      screen: CartScreen(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'User Information',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    UserInfoTile(
                      title: 'Email',
                      subtitle: 'empty',
                      icon: Feather.mail,
                    ),
                    UserInfoTile(
                      title: 'Phone number',
                      subtitle: 'empty',
                      icon: Feather.phone,
                    ),
                    UserInfoTile(
                      title: 'Shopping Adress',
                      subtitle: 'empty',
                      icon: Feather.truck,
                    ),
                    UserInfoTile(
                      title: 'Join date',
                      subtitle: 'empty',
                      icon: Feather.clock,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'User Settings',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTileSwitch(
                      value: theme.darkTheme,
                      leading: const Icon(Feather.moon),
                      onChanged: (value) {
                        setState(() {
                          theme.darkTheme = value;
                        });
                      },
                      switchActiveColor: kPrimaryColor,
                      switchScale: 0.8,
                      switchType: SwitchType.cupertino,
                      title: const Text(
                        'Dark Theme',
                      ),
                    ),
                    UserInfoTile(
                      title: 'Join date',
                      subtitle: '',
                      icon: Icons.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_controller.hasClients) {
      double offset = _controller.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
