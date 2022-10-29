import 'pokemon_stats.dart';

class PokemonEntity {
  final int id;
  final String name;
  final String? imageUrl;
  final PokemonType? primaryType;
  final PokemonType? secondaryType;
  final String? description;
  final PokemonStatsEntity stats;

  const PokemonEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.primaryType,
    required this.secondaryType,
    this.description,
    required this.stats,
  });
}

enum PokemonType {
  normal('normal'),
  fighting('fighting'),
  flying('flying'),
  poison('poison'),
  ground('ground'),
  rock('rock'),
  bug('bug'),
  ghost('ghost'),
  steel('steel'),
  fire('fire'),
  water('water'),
  grass('grass'),
  electric('electric'),
  psychic('psychic'),
  ice('ice'),
  dragon('dragon'),
  dark('dark'),
  fairy('fairy');

  final String name;
  const PokemonType(this.name);

  @override
  String toString() => name;
}
