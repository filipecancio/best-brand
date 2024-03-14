import 'dart:developer';

import 'package:best_brand/components/atom/product_item.dart';
import 'package:best_brand/domain/bb_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final BBRepository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _names = [];

  Future<void> fetchData() async {
    List<String> data = await widget.repository.readJson();

    setState(() {
      _names = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    log('vaalores $_names');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("home"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _names.length,
          itemBuilder: (context, index) {
            return ProductItem(name: _names[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
