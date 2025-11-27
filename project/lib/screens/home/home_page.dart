import 'package:flutter/material.dart';
import '../products/product_page.dart';
import '../cart/cart_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text("Agcorp Menu"),
              accountEmail: Text("info@agcorp.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text("Products"),
              onTap: () => Navigator.pushNamed(context, "/products"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              onTap: () => Navigator.pushNamed(context, "/cart"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => Navigator.pushNamed(context, "/profile"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => Navigator.pushNamed(context, "/settings"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("⚡ Agcorp Store"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://example.com/logo.png"),
            ),
            SizedBox(height: 20),
            buildAd(
              "https://images.pexels.com/photos/34254816/pexels-photo-34254816.jpeg",
            ),
            buildAd(
              "https://images.pexels.com/photos/265947/pexels-photo-265947.jpeg",
            ),
            buildAd(
              "https://images.pexels.com/photos/296230/pexels-photo-296230.jpeg",
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/products"),
              child: Text("Shop Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAd(String img) {
    return Container(
      height: 180,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
      ),
    );
  }
}
