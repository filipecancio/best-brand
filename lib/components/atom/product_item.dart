import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.name});

  final String name;

  @override
  State<StatefulWidget> createState() {
    return ProductItemState();
  }

}

class ProductItemState extends State<ProductItem>{
  @override
  Widget build(BuildContext context) {
    return Text(widget.name);
  }

}