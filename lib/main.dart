import 'package:flutter/material.dart';

import 'poke_atlas/core/dependency_injection.dart';
import 'poke_atlas/presentation/pages/splash_page.dart';

void main() {
  Injection.registerDependencies();
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
      home: const SplashPage(),
    );
  }
}
