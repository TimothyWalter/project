import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/products/product_page.dart';
import 'screens/cart/cart_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/settings/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "/products": (context) => ProductPage(),
        "/cart": (context) => CartPage(),
        "/profile": (context) => ProfilePage(),
        "/settings": (context) => SettingsPage(),
      },
    );
  }
}
