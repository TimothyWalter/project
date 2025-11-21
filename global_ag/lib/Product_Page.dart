// ignore_for_file: empty_constructor_bodies, file_names

import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class Product_Page extends StatelessWidget {
  const Product_Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Future<void> openVideo(String url, dynamic LaunchMode) async {
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

launchUrl(Uri uri, {required mode}) async {}

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
Widget Build(BuildContext context, dynamic product) {
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
