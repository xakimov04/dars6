import 'package:dars6/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/black.png"),
                  placeholder: const AssetImage(
                    "assets/gif/loading.gif",
                  ),
                  image: NetworkImage(
                    product.images,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                product.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                product.description,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
