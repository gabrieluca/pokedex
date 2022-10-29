import 'pokemon_stats.dart';

class PokemonDetailEntity {
  final int id;
  final String name;
  final String? imageUrl;
  final String? largeImageUrl;
  final PokemonType? primaryType;
  final PokemonType? secondaryType;
  final PokemonStatsEntity stats;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    this.largeImageUrl,
    required this.primaryType,
    required this.secondaryType,
    required this.stats,
  });

  PokemonDetailEntity copyWith({
    int? id,
    String? name,
    String? imageUrl,
    PokemonType? primaryType,
    PokemonType? secondaryType,
    PokemonStatsEntity? stats,
  }) {
    return PokemonDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      primaryType: primaryType ?? this.primaryType,
      secondaryType: secondaryType ?? this.secondaryType,
      stats: stats ?? this.stats,
    );
  }

  factory PokemonDetailEntity.fromMap(Map<String, dynamic> map) {
    return PokemonDetailEntity(
      id: map['id']?.toInt(),
      name: map['name'],
      imageUrl: map['sprites']['other']['official-artwork']['front_default'],
      primaryType: pokemonTypeFromMap[map['types'][0]['type']['name']],
      secondaryType: (map['types'] as List).length > 1
          ? pokemonTypeFromMap[map['types']?[1]['type']['name']]
          : null,
      stats: PokemonStatsEntity.fromMap(map['stats']),
    );
  }

  @override
  String toString() {
    return 'PokemonDetailEntity(id: $id, name: $name, imageUrl: $imageUrl, largeImageUrl: $largeImageUrl, primaryType: $primaryType, secondaryType: $secondaryType, stats: $stats)';
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

const pokemonTypeFromMap = {
  'normal': PokemonType.normal,
  'fighting': PokemonType.fighting,
  'flying': PokemonType.flying,
  'poison': PokemonType.poison,
  'ground': PokemonType.ground,
  'rock': PokemonType.rock,
  'bug': PokemonType.bug,
  'ghost': PokemonType.ghost,
  'steel': PokemonType.steel,
  'fire': PokemonType.fire,
  'water': PokemonType.water,
  'grass': PokemonType.grass,
  'electric': PokemonType.electric,
  'psychic': PokemonType.psychic,
  'ice': PokemonType.ice,
  'dragon': PokemonType.dragon,
  'dark': PokemonType.dark,
  'fairy': PokemonType.fairy,
};
