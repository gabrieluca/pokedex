import 'package:flutter/material.dart';

import 'poke_atlas/screens/home_page.dart';

void main() {
  runApp(const PokeAtlasApp());
}

class PokeAtlasApp extends StatelessWidget {
  const PokeAtlasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poke Atlas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
