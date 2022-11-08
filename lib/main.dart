import 'package:flutter/material.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/view/details_screen.dart';
import 'package:food_app/view/navigation.dart';
import 'package:food_app/view/home_screens.dart';
import 'package:food_app/view/product_cart.dart';
import 'package:food_app/view/spash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>(
        create: (context) => ProductProvider(),
      )
    ],
    builder: (context, _) => MaterialApp(
      initialRoute: 'spashScreen',
      routes: {
        '/': (context) => const HomeScreen(),
        'Navigation':(context) => const Navigation(),
        'spashScreen': (context) => const SpashScreen(),
        'cart_screen': (context) => const cart_screen(),
        'DetailsScreen': (context) => DetailsScreens(
              id: 0,
            ),
      },
    ),
  ));
}
