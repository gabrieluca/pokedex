import 'package:flutter/material.dart';

import 'poke_atlas/core/dependency_injection.dart';
import 'poke_atlas/presentation/screens/home/home_page.dart';
import 'poke_atlas/presentation/utils/constants.dart';

void main() {
  Injection.registerDependencies();
  runApp(const PokeAtlasApp());
}

class PokeAtlasApp extends StatelessWidget {
  const PokeAtlasApp({this.child, Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextConstants.appTitle,
      theme: _appTheme,
      home: child ?? const HomePage(),
    );
  }
}

const _appFontFamily = 'FiraCode';
const _textColor = Colors.white;

final _appTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: _appFontFamily,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 20,
      color: _textColor,
    ),
    titleMedium: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _textColor,
    ),
    titleSmall: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 16,
      color: _textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 14,
      color: _textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: _appFontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _textColor,
    ),
  ),
);
