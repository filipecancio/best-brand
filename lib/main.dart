import 'package:best_brand/domain/bb_repository.dart';
import 'package:best_brand/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BBRepository repository = BBRepository();

  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BestBrand',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(repository: repository)
    );
  }
}