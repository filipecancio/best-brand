import 'dart:developer';

import 'package:best_brand/components/atom/product_item.dart';
import 'package:best_brand/domain/bb_repository.dart';
import 'package:flutter/material.dart';

import '../domain/product.dart';

class HomeScreen extends StatefulWidget {
  final BBRepository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _productList = [];

  Future<void> fetchData() async {
    List<Product> data = await widget.repository.readFeedJson();

    setState(() {
      _productList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("home"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _productList.length,
          itemBuilder: (context, index) {
            return ProductItem(name: _productList[index].product.name);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
