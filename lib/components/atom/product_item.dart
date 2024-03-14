import 'package:best_brand/domain/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Brand product;

  @override
  State<StatefulWidget> createState() {
    return ProductItemState();
  }

}

class ProductItemState extends State<ProductItem>{
  @override
  Widget build(BuildContext context) {
    return Text(widget.product.product.name);
  }

}