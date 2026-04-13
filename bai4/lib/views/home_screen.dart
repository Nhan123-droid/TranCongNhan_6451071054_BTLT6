import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> products;

  @override
  void initState() {
    super.initState();
    _initializeProducts();
  }

  void _initializeProducts() {
    products = [
      Product(id: 1, name: 'Sản phẩm 1', price: 100000),
      Product(id: 2, name: 'Sản phẩm 2', price: 200000),
      Product(id: 3, name: 'Sản phẩm 3', price: 150000),
      Product(id: 4, name: 'Sản phẩm 4', price: 250000),
      Product(id: 5, name: 'Sản phẩm 5', price: 180000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
