import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/cololrs.dart';
import 'package:food_app/view/product_cart.dart';
import 'package:food_app/view/product_like.dart';

import 'home_screens.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController(initialPage: 2);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    like_screen(),
    cart_screen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:PageView(
        controller: controller,
        children:  [
          _widgetOptions.elementAt(_selectedIndex),
        ],
      ),
      // _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 20, right: 20),
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: primary,
           enableFloatingNavBar: false,


          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home,size: 30),
              //selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite,size: 30),

            ),

            DotNavigationBarItem(
              icon: Icon(Icons.shopping_cart,size: 30),
              //selectedColor: Color(0xff73544C),
            ),

            // DotNavigationBarItem(
            //   icon: Icon(Icons.person,size: 30),
            // ),
          ],
        ),

      ),

    );
  }
}
