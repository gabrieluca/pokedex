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
}
