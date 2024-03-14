import 'dart:convert';
import 'package:best_brand/domain/product.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:developer';

class BBRepository {

  final List<String> _productList = ["tenis","bone","camisa","oculos","calca"];

  Future<List<String>> readJson() async {
    List<dynamic> items = [];
    List<String> names = [];

    final String response = await rootBundle.loadString('lib/assets/feed.json');
    final data = await json.decode(response);

    items = data["produtos"];
    log('vaalores $items');
    items = items.map((product) => product['product']).toList();
    names = items.map((product) => product['name'].toString()).toList();

    return names;
  }

  Future<List<Product>> readFeedJson() async {
    final String response = await rootBundle.loadString('lib/assets/feed.json');
    final data = await json.decode(response);

    List<dynamic> items = data["produtos"];
    List<Product> productList = items.map((i) => Product.fromJson(i)).toList();

    return productList;
  }

  List<String> getAllProducts(){
    return _productList;
  }

}