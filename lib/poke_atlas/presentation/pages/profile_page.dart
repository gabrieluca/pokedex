import 'package:flutter/material.dart';

import '../../domain/entitites/pokemon_detail.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.pokemon, this.description, {Key? key})
      : super(key: key);

  final PokemonDetailEntity pokemon;
  final Description? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          description ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
