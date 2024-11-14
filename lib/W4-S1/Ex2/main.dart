import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

enum Product {
  dart("Dart", "The best object-oriented language", "dart.png"),
  flutter("Flutter", "The best UI toolkit", "flutter.png"),
  firebase("Firebase", "The best backend-as-a-service", "firebase.png");

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        )
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key
    });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/${product.imagePath}", width: 70, colorBlendMode: BlendMode.multiply,),
              Text(product.title, style: const TextStyle(fontSize: 30, color: Colors.black)),
              Text(product.description, style: const TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
    // return Text(Product.dart.title);
  }
}