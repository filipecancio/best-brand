import 'package:best_brand/domain/bb_repository.dart';
import 'package:best_brand/screen/detail_screen.dart';
import 'package:best_brand/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/bb_navigation.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => BBNavigation(),
        child: MaterialApp(
            title: 'BestBrand',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MainScreen()));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BBRepository repository = BBRepository();

  @override
  Widget build(BuildContext context) {
    navigation = context.watch<BBNavigation>();

    Widget currentScreen = const SizedBox.shrink();
    if (navigation.currentNavigation == BBNavigationType.home) {
      currentScreen = HomeScreen(repository: repository);
    } else if (navigation.currentNavigation == BBNavigationType.detail) {
      currentScreen = const DetailScreen();
    }

    return currentScreen;
  }
}
