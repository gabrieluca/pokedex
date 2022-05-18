class PokemonStatsItemEntity {
  final String name;
  final int baseStat;
  final int effort;

  const PokemonStatsItemEntity({
    required this.name,
    required this.baseStat,
    required this.effort,
  });

  PokemonStatsItemEntity copyWith({
    String? name,
    int? baseStat,
    int? effort,
  }) {
    return PokemonStatsItemEntity(
      name: name ?? this.name,
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
    );
  }

  factory PokemonStatsItemEntity.fromMap(Map<String, dynamic> map) {
    return PokemonStatsItemEntity(
      name: map['stat']['name'] ?? '',
      baseStat: map['base_stat']?.toInt() ?? 0,
      effort: map['effort']?.toInt() ?? 0,
    );
  }

  @override
  String toString() =>
      'StatsItemEntity(name: $name, baseStat: $baseStat, effort: $effort)';
}
