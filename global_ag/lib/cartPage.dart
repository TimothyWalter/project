import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

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
