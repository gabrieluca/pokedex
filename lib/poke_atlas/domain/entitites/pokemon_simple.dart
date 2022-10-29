class PokemonSimpleEntity {
  PokemonSimpleEntity({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  PokemonSimpleEntity copyWith({
    String? name,
    String? url,
  }) {
    return PokemonSimpleEntity(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory PokemonSimpleEntity.fromMap(Map<String, dynamic> map) =>
      PokemonSimpleEntity(
        name: map['name'],
        url: map['url'],
      );

  @override
  String toString() => 'PokemonSimpleEntity(name: $name, url: $url)';
}
