import 'package:best_brand/domain/product.dart';
import 'package:flutter/material.dart';

import '../../navigation/bb_navigation.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Brand product;

  @override
  State<StatefulWidget> createState() {
    return ProductItemState();
  }
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          navigation.navigateTo(BBNavigationType.detail);
        },
        child: Card(
          child: ListTile(
            leading: Image.asset("lib/images/avatar.png"),
            title: Text(widget.product.product.name),
            subtitle: Text(widget.product.company.name),
            trailing: const Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ));
    //Text(widget.product.product.name);
  }
}
