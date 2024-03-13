import 'dart:convert';
import 'dart:developer';

import 'package:best_brand/components/atom/product_item.dart';
import 'package:best_brand/domain/bb_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  final BBRepository repository;

  const HomeScreen({
    super.key,
    required this.repository
  });



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late dynamic _feedEstatico;
  List<dynamic> _items = [];
  int _proximaPagina = 1;

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/assets/feed.json');
    _feedEstatico = await json.decode(response);
    setState(() {
      _items = _feedEstatico["produtos"];
      _items = _items.map((product) => product['product']).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    log('vaalores $_items');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("home"),
      ),
      body: Center(
        child: GridView.count(
            crossAxisCount: 2,
          children: _items.isEmpty ?
          _items.map((product) => ProductItem(name: product['name'])).toList()
              : [Container()]
          //widget.repository.getAllProducts().map((product) => ProductItem(name: product)).toList(), //if(_items != null){_items.map((product) => ProductItem(name: product['name'])).toList()} else {[]}
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
