import 'package:flutter/material.dart';
import 'package:genshin_project/GenshinImpact.dart';
import 'package:genshin_project/model/customScorllBehavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Genshin Impact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GenshinImpact(),
    );
  }
}
