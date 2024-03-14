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
  List<Brand> _brandList = [];

  Future<void> fetchData() async {
    List<Brand> allBrands = await widget.repository.getAllBrands();

    setState(() {
      _brandList = allBrands;
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
          itemCount: _brandList.length,
          itemBuilder: (context, index) {
            return ProductItem(product: _brandList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
