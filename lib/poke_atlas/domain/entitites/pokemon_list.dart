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

  PokemonListEntity copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonSimpleEntity>? pokemonList,
  }) {
    return PokemonListEntity(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      pokemonList: pokemonList ?? this.pokemonList,
    );
  }

  factory PokemonListEntity.fromMap(Map<String, dynamic> map) =>
      PokemonListEntity(
        count: map['count'],
        next: map['next'],
        previous: map['previous'],
        pokemonList: List<PokemonSimpleEntity>.from(
          map['results'].map(
            (x) => PokemonSimpleEntity.fromMap(x),
          ),
        ),
      );

  @override
  String toString() {
    return 'PokemonListEntity(count: $count, next: $next, previous: $previous, pokemonList: $pokemonList)';
  }
}
