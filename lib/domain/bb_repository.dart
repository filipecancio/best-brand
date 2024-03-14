import 'dart:convert';
import 'package:best_brand/domain/product.dart';
import 'package:flutter/services.dart';

class BBRepository {

  final List<String> _productList = ["tenis","bone","camisa","oculos","calca"];

  Future<List<Brand>> readFeedJson() async {
    final String response = await rootBundle.loadString('lib/assets/feed.json');
    final data = await json.decode(response);

    List<dynamic> items = data["produtos"];
    List<Brand> productList = items.map((i) => Brand.fromJson(i)).toList();

    return productList;
  }

  List<String> getAllProducts(){
    return _productList;
  }

}