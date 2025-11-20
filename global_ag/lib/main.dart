import 'package:flutter/material.dart';
import 'package:global_ag/ProductDetailedPage.dart';
import 'dart:async';

void main() {
  runApp(SplashScreen());
}

/// ---------------------------------------------------------
/// FUTURISTIC SPLASH SCREEN
/// ---------------------------------------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> glow;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    glow = Tween<double>(begin: 0.3, end: 1.0).animate(controller);

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => MyApp(),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedBuilder(
            animation: glow,
            builder: (_, child) {
              return Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.greenAccent.withOpacity(glow.value),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(glow.value),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "NEON FUTURE STORE",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------
/// MAIN APP
/// ---------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Neon Future Store",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.greenAccent,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.greenAccent)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

/// ---------------------------------------------------------
/// PRODUCT MODEL
/// ---------------------------------------------------------
class Product {
  final String name;
  final String description;
  final double price;
  final double rating;
  final List<String> images;
  final String videoUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.images,
    required this.videoUrl,
  });
}

/// ---------------------------------------------------------
/// SAMPLE PRODUCTS
/// ---------------------------------------------------------
final List<Product> sampleProducts = [
  Product(
    name: "Neon Cyber Sneakers",
    description: "Shoes with neon edges and lightweight future tech.",
    price: 300,
    rating: 4.9,
    images: [
      "https://images.unsplash.com/photo-1528701800489-20be9c596a03",
      "https://images.unsplash.com/photo-1606813902914-002d9f42b1e9",
      "https://images.unsplash.com/photo-1580910051074-7c38a94a5914",
    ],
    videoUrl: "https://www.youtube.com/watch?v=2Vv-BfVoq4g",
  ),
  Product(
    name: "Quantum Earbuds",
    description: "Earbuds with holographic interface.",
    price: 180,
    rating: 4.7,
    images: [
      "https://images.unsplash.com/photo-1585386959984-a4155224a1ad",
      "https://images.unsplash.com/photo-1580894908361-967195bd4c1f",
      "https://images.unsplash.com/photo-1585386959982-33197df7d2fb",
    ],
    videoUrl: "https://www.youtube.com/watch?v=jfKfPfyJRdk",
  ),
];

/// ---------------------------------------------------------
/// HOME PAGE
/// ---------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget neonCard(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("⚡ Neon Store"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.greenAccent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            color: Colors.black,
            onSelected: (value) {
              Navigator.pushNamed(context, value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: "/", child: Text("Products")),
              PopupMenuItem(value: "/cart", child: Text("Cart")),
              PopupMenuItem(value: "/settings", child: Text("Settings")),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final p = sampleProducts[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: neonCard(
              ListTile(
                leading: Image.network(p.images[0]),
                title: Text(p.name),
                subtitle: Text("Ksh ${p.price}"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.greenAccent,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      pageBuilder: (_, __, ___) =>
                          ProductDetailedPage(product: p),
                      transitionsBuilder: (_, anim, __, child) {
                        return ScaleTransition(
                          scale: Tween(begin: 0.8, end: 1.0).animate(anim),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------------------------------------------------------
/// PRODUCT DETAILS PAGE
/// ---------------------------------------------------------
class ProductDetailedPage extends StatelessWidget {
  final Product product;
  const ProductDetailedPage({super.key, required this.product});

  Future<void> openVideo(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Unable to open video";
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Widget neonGlow(Widget child) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.greenAccent),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.greenAccent.withOpacity(0.6),
          blurRadius: 25,
          spreadRadius: 2,
        ),
      ],
    ),
    child: child,
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(product.name),
      backgroundColor: Colors.black,
      foregroundColor: Colors.greenAccent,
    ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // IMAGE GALLERY
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: product.images.map((img) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: neonGlow(
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(img, width: 300),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 15),

          Text(product.description, style: TextStyle(fontSize: 16)),
          Text("Price: Ksh ${product.price}", style: TextStyle(fontSize: 22)),
          SizedBox(height: 10),

          ElevatedButton.icon(
            onPressed: () => openVideo(product.videoUrl),
            icon: Icon(Icons.play_circle_fill),
            label: Text("Watch Video"),
          ),

          Spacer(),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                  child: Text("BUY"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.greenAccent),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Listed for sale")));
                  },
                  child: Text("SELL"),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// ---------------------------------------------------------
/// CART PAGE
/// ---------------------------------------------------------
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text("Your cart is empty.", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

/// ---------------------------------------------------------
/// SETTINGS PAGE
/// ---------------------------------------------------------
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text("Settings Area", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
