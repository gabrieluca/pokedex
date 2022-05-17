import 'pokemon_stats.dart';

class PokemonDetailEntity {
  final int id;
  final String name;
  final String? imageUrl;
  final PokemonType? primaryType;
  final PokemonType? secondaryType;
  final PokemonStatsEntity stats;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.primaryType,
    required this.secondaryType,
    required this.stats,
  });

  @override
  String toString() {
    return 'PokemonEntity(id: $id, name: $name, imageUrl: $imageUrl, primaryType: $primaryType, secondaryType: $secondaryType, stats: $stats)';
  }
}

typedef Description = String;

enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy;

  String value() => toString().split('.')[1];
}
