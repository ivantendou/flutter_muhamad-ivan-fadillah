import 'package:flutter/material.dart';
import 'package:laptopshop_provider_app/screens/cart_page.dart';
import 'package:provider/provider.dart';

import '../models/cart_manager.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptop Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: const ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> productList = Product().productList;
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orange.withOpacity(0.5),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Consumer<CartManager>(
            builder: (context, CartManager item, widget) {
              return ProductCards(
                productName: productList[index],
                isAdded: item.cartList.contains(productList[index]),
                onTap: () {
                  item.complete(productList[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCards extends StatelessWidget {
  const ProductCards({
    Key? key,
    required this.productName,
    required this.isAdded,
    required this.onTap,
  }) : super(key: key);
  final String productName;
  final bool isAdded;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset(
                'assets/laptop.jpg',
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: isAdded
                        ? Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow[900],
                          )
                        : const Icon(Icons.shopping_cart),
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
