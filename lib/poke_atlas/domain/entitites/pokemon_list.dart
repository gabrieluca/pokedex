import 'pokemon_simple.dart';

class PokemonListEntity {
  PokemonListEntity({
    this.count = 0,
    this.next,
    this.previous,
    this.pokemonList = const [],
  });

  final int count;
  final String? next;
  final String? previous;
  final List<PokemonSimpleEntity> pokemonList;
}
