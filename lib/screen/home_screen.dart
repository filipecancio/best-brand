import 'dart:developer';

import 'package:best_brand/components/atom/product_item.dart';
import 'package:best_brand/domain/bb_repository.dart';
import 'package:flutter/material.dart';

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
  late Future<dynamic> _staticfeed;

  void getData(){
    setState(() {
      _staticfeed = widget.repository.readJson();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("home"),
      ),
      body: Center(
        child: GridView.count(
            crossAxisCount: 2,
          children: widget.repository.getAllProducts().map((product) => ProductItem(name: product)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
