import 'package:flutter/material.dart';

void main() {
  runApp(const ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {
  const ProductNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const ProductListPage(),
    );
  }
}

// ------------------------------------------------------------
// PRODUCT MODEL
// ------------------------------------------------------------

class Product {
  final String name;
  final String description;
  final double price;
  final Color color;
  final int rating;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.rating,
  });
}

// ------------------------------------------------------------
// PRODUCT DATA
// ------------------------------------------------------------

const List<Product> products = [
  Product(
    name: 'Pixel',
    description: 'Pixel is the most featureful phone ever',
    price: 800,
    color: Color(0xFF3F63D8),
    rating: 3,
  ),
  Product(
    name: 'Laptop',
    description: 'Laptop is most productive development tool',
    price: 2000,
    color: Color(0xFF32D435),
    rating: 3,
  ),
  Product(
    name: 'Tablet',
    description: 'Tablet is the most useful device ever for meeting',
    price: 1500,
    color: Color(0xFFD4C62C),
    rating: 3,
  ),
  Product(
    name: 'Pendrive',
    description: 'iPhone is the stylist phone ever',
    price: 100,
    color: Color(0xFFC85C3E),
    rating: 3,
  ),
  Product(
    name: 'Floppy Drive',
    description: 'Floppy drive is a useful storage device',
    price: 50,
    color: Color(0xFF40B8A9),
    rating: 2,
  ),
];

// ------------------------------------------------------------
// PRODUCT LIST PAGE
// ------------------------------------------------------------

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            product: product,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(
                    product: product,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// PRODUCT CARD
// ------------------------------------------------------------

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 5,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              // Product image/name section
              Expanded(
                flex: 4,
                child: Container(
                  color: product.color,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      product.name.toLowerCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),

              // Product information section
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Expanded(
                        child: Text(
                          product.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      Text(
                        'Price: ${product.price.toInt()}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 5),

                      RatingStars(
                        rating: product.rating,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// RATING STARS
// ------------------------------------------------------------

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Icon(
          index < rating
              ? Icons.star
              : Icons.star_border,
          color: index < rating
              ? Colors.redAccent
              : Colors.redAccent,
          size: 23,
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PRODUCT DETAILS PAGE
// ------------------------------------------------------------

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(product.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          // Large product image
          Container(
            height: 260,
            width: double.infinity,
            color: product.color,
            alignment: Alignment.center,
            child: Text(
              product.name.toLowerCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 58,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 45,
              ),
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 45),

                  Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 45),

                  Text(
                    'Price: ${product.price.toInt()}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const Spacer(),

                  RatingStars(
                    rating: product.rating,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

