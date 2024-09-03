import 'package:adhunitech/configs/themes.dart';
import 'package:adhunitech/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // This will remove leading hash (#) from url.
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
