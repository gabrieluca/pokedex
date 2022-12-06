import 'pokemon_stats_item.dart';

class PokemonStatsEntity {
  final PokemonStatsItemEntity hp;
  final PokemonStatsItemEntity attack;
  final PokemonStatsItemEntity defense;
  final PokemonStatsItemEntity specialAttack;
  final PokemonStatsItemEntity specialDefense;
  final PokemonStatsItemEntity speed;

  const PokemonStatsEntity({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  PokemonStatsEntity copyWith({
    PokemonStatsItemEntity? hp,
    PokemonStatsItemEntity? attack,
    PokemonStatsItemEntity? defense,
    PokemonStatsItemEntity? specialAttack,
    PokemonStatsItemEntity? specialDefense,
    PokemonStatsItemEntity? speed,
  }) {
    return PokemonStatsEntity(
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
    );
  }

  factory PokemonStatsEntity.fromMap(List<dynamic> list) {
    return PokemonStatsEntity(
      hp: PokemonStatsItemEntity.fromMap(list.first),
      attack: PokemonStatsItemEntity.fromMap(list[1]),
      defense: PokemonStatsItemEntity.fromMap(list[2]),
      specialAttack: PokemonStatsItemEntity.fromMap(list[3]),
      specialDefense: PokemonStatsItemEntity.fromMap(list[4]),
      speed: PokemonStatsItemEntity.fromMap(list[5]),
    );
  }

  @override
  String toString() {
    return 'PokemonStatsEntity(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }
}
