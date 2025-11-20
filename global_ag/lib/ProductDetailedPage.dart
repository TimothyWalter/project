import 'package:flutter/material.dart';

/// Simple product model
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
  });
}

/// ProductDetailedPage: expects a Product passed via Navigator arguments.
/// Use ProductDetailedPage.routeName when pushing routes.
class ProductDetailedPage extends StatelessWidget {
  static const String routeName = '/product';

  final Product product;

  const ProductDetailedPage({super.key, required this.product});

  /// Use this builder when registering routes so arguments can be extracted
  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Product) {
      return ProductDetailedPage(product: args);
    }
    return const Scaffold(body: Center(child: Text('No product provided')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                (route) => false,
              );
            },
            tooltip: 'Home',
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName);
            },
            tooltip: 'Cart',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (product.imageUrl != null)
            Image.network(product.imageUrl!)
          else
            Container(
              height: 200,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const Icon(Icons.image, size: 80, color: Colors.white70),
            ),
          const SizedBox(height: 16),
          Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(product.description),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Add to Cart'),
            onPressed: () {
              // Example: navigate to cart and pass the product as an argument
              Navigator.pushNamed(
                context,
                CartPage.routeName,
                arguments: product,
              );
            },
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            child: const Text('Back to Products'),
            onPressed: () {
              Navigator.pushNamed(context, ProductListPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}

/// Home page stub
class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Browse Products'),
          onPressed: () {
            Navigator.pushNamed(context, ProductListPage.routeName);
          },
        ),
      ),
    );
  }
}

/// Product list page (links to ProductDetailedPage)
class ProductListPage extends StatelessWidget {
  static const String routeName = '/products';

  ProductListPage({super.key});

  final List<Product> sampleProducts = [
    Product(
      id: '1',
      name: 'Sample Widget',
      description: 'A useful widget that helps you do many things.',
      price: 19.99,
      imageUrl: null,
    ),
    Product(
      id: '2',
      name: 'Gadget Pro',
      description: 'A premium gadget for professionals.',
      price: 49.99,
      imageUrl: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final p = sampleProducts[index];
          return ListTile(
            leading: const Icon(Icons.storefront),
            title: Text(p.name),
            subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductDetailedPage.routeName,
                arguments: p,
              );
            },
          );
        },
      ),
    );
  }
}

/// Cart page stub (may receive a Product as an argument to add)
class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String message = 'Cart is empty';
    if (args is Product) {
      message = 'Added "${args.name}" to cart (demo)';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(child: Text(message)),
    );
  }
}

/// Helper to get the app routes to register in MaterialApp
Map<String, WidgetBuilder> getAppRoutes() {
  return {
    HomePage.routeName: (context) => const HomePage(),
    ProductListPage.routeName: (context) => ProductListPage(),
    ProductDetailedPage.routeName: (context) =>
        ProductDetailedPage.builder(context),
    CartPage.routeName: (context) => const CartPage(),
  };
}
