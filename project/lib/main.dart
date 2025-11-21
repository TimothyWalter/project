import 'package:flutter/material.dart';
import 'package:project/cartPage.dart';

import 'Product_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      },
      child: Icon(Icons.shopping_cart),
    );
    return MaterialApp(
      title: 'greenco',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("⚡ Neon Store"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.lightBlueAccent,
            elevation: 0,
            actions: [
              PopupMenuButton<String>(
                color: Colors.lightBlueAccent,
                onSelected: (value) {
                  Navigator.pushNamed(context, value);
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: "/", child: Text("Products")),
                  PopupMenuItem(value: "/settings", child: Text("Settings")),
                  PopupMenuItem(value: "/profile", child: Text("Profile")),
                ],
              ),
            ],
          ),
          body: Center(
            child: Image(
              image: NetworkImage(
                "https://images.pexels.com/photos/34254816/pexels-photo-34254816.jpeg?cs=srgb&dl=pexels-mehmet-34254816.jpg&fm=jpg&_gl=1*lq9977*_ga*MTc5MDQxMzY1NS4xNzYyMjU0OTgy*_ga_8JE65Q40S6*czE3NjM3MzA0MjAkbzckZzEkdDE3NjM3MzIxOTUkajQ3JGwwJGgw",
              ),
            ),
          ),

          /*drawer implementation*/
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Home tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Marketplace'),
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) => Product_Page()),
                    );
                    // Handle Marketplace tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('cart'),
                  onTap: () {
                    // Handle Traders tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Contact Us'),
                  onTap: () {
                    // Handle Contact Us tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
