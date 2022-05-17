import 'package:flutter/material.dart';

import '../../domain/entitites/pokemon_detail.dart';

class LayoutMapper {
  static const Map<PokemonType, Color> getColorFromPokemonTypeMap = {
    PokemonType.normal: Color.fromRGBO(168, 168, 120, 1),
    PokemonType.fire: Color.fromRGBO(240, 128, 48, 1),
    PokemonType.fighting: Color.fromRGBO(192, 48, 40, 1),
    PokemonType.water: Color.fromRGBO(104, 144, 240, 1),
    PokemonType.grass: Color.fromRGBO(120, 200, 80, 1),
    PokemonType.poison: Color.fromRGBO(160, 64, 160, 1),
    PokemonType.electric: Color.fromRGBO(248, 208, 48, 1),
    PokemonType.ground: Color.fromRGBO(224, 192, 104, 1),
    PokemonType.rock: Color.fromRGBO(184, 160, 56, 1),
    PokemonType.bug: Color.fromRGBO(168, 184, 32, 1),
    PokemonType.dragon: Color.fromRGBO(112, 56, 248, 1),
    PokemonType.ghost: Color.fromRGBO(112, 88, 152, 1),
    PokemonType.dark: Color.fromRGBO(112, 88, 72, 1),
    PokemonType.fairy: Color.fromRGBO(238, 153, 172, 1),
    PokemonType.steel: Color.fromRGBO(184, 184, 208, 1),
    PokemonType.psychic: Color.fromRGBO(248, 88, 136, 1),
    PokemonType.ice: Color.fromRGBO(152, 216, 216, 1),
    PokemonType.flying: Color.fromRGBO(168, 144, 240, 1),
  };

  static const Map<PokemonType, String> getImageAssetFromPokemonTypeMap = {
    PokemonType.normal: 'assets/images/types/normal 1.png',
    PokemonType.fire: 'assets/images/types/fire 1.png',
    PokemonType.fighting: 'assets/images/types/fighting 1.png',
    PokemonType.water: 'assets/images/types/water 1.png',
    PokemonType.grass: 'assets/images/types/grass 1.png',
    PokemonType.poison: 'assets/images/types/poison 1.png',
    PokemonType.electric: 'assets/images/types/electric 1.png',
    PokemonType.ground: 'assets/images/types/ground 1.png',
    PokemonType.rock: 'assets/images/types/rock 1.png',
    PokemonType.bug: 'assets/images/types/bug 1.png',
    PokemonType.dragon: 'assets/images/types/dragon 1.png',
    PokemonType.ghost: 'assets/images/types/ghost 1.png',
    PokemonType.dark: 'assets/images/types/dark 1.png',
    PokemonType.fairy: 'assets/images/types/fairy 1.png',
    PokemonType.steel: 'assets/images/types/steel 1.png',
    PokemonType.psychic: 'assets/images/types/psychic 1.png',
    PokemonType.ice: 'assets/images/types/ice 1.png',
    PokemonType.flying: 'assets/images/types/flying 1.png',
  };
}
