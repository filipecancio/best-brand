import 'dart:convert';
import 'dart:developer';

import 'package:best_brand/components/atom/product_item.dart';
import 'package:best_brand/domain/bb_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  final BBRepository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late dynamic _feedEstatico;
  List<dynamic> _items = [];
  List<String> _names = [];
  int _proximaPagina = 1;

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/assets/feed.json');
    _feedEstatico = await json.decode(response);
    setState(() {
      _items = _feedEstatico["produtos"];
      _items = _items.map((product) => product['product']).toList();
      _names = _items.map((product) => product['name'].toString()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    log('vaalores $_names');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("home"),
      ),
      body: Center(
          child: _names.isEmpty
              ? GridView.count(
                  crossAxisCount: 2,
                  children: _names
                      .map((product) => ProductItem(name: product))
                      .toList())
              : Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
